class Paycheck < ActiveRecord::Base
  include PaychecksHelper
  attr_accessible :delivered_at, :employee_id, :end_at, :id, :payrate_id, :prepared_at, :start_at, :status, :user_id, :fte
  belongs_to :employee
  belongs_to :pay_rate, foreign_key: :payrate_id
  has_many :adjustments
  
  def self.for_period(pay_period)
    employees = Employee.find(:all, conditions: ["datedeactivated is null or datedeactivated > ?",pay_period.last])
    paychecks = employees
      .collect { |e| e.current_paycheck(pay_period.last) }
      .find_all{ |p| 
        !p.nil? and !p.pay_rate.nil? and (!p.pay_rate.monthly? or (p.pay_rate.monthly? and pay_period.last == p.end_at))
      }
    return paychecks
  end

  def self.get_stats_for(paychecks)
    total_payroll, total_cafe, total_soksa, total_kinyei = 0,0,0,0
    paychecks.each { |p| 
      total_payroll += p.get_total_pay || 0 
      total_cafe += p.pay_rate.cost_center_id == CostCenter::CAFE ? p.get_total_pay || 0 : 0
      total_soksa += p.pay_rate.cost_center_id == CostCenter::SOKSABIKE ? p.get_total_pay || 0 : 0
      total_kinyei += p.pay_rate.cost_center_id == CostCenter::KINYEI || p.pay_rate.cost_center_id.nil? ? p.get_total_pay || 0 : 0
    }
    return { total_cafe: total_cafe, total_kinyei: total_kinyei, total_soksa: total_soksa, total_payroll: total_payroll }
  end

  def get_pay
    self.pay_rate.calculate_pay(self)
  end
  
  def get_leave
    self.pay_rate.calculate_leave(self)
  end
  
  def get_hours
    employee.get_worked_shift_total_for self.start_at, self.end_at
  end
  
  def get_adjustments
    return self.adjustments.sum(:pay)
  end 
  
  def get_adjustments_leave
    return self.adjustments.sum(:leave)
  end 
  
  def get_leave_taken_total
    employee.get_leave_total_for self.start_at, self.end_at
  end
  
  def get_leave_balance
    employee.get_old_leave(self.start_at) - employee.get_leave_total_for(self.start_at, self.end_at) + self.pay_rate.calculate_leave(self)
  end
  
  def get_total_pay
    return (self.total_adjustments_pay || 0) + (self.total_pay || 0)
  end
  
  def recount
    self.fte = pay_rate.FTE
    
    self.total_adjustments_pay = self.get_adjustments
    self.total_adjustments_leave = self.get_adjustments_leave
    self.total_hours = self.get_hours
    self.total_leave = self.get_leave
    self.total_leave_taken = self.get_leave_taken_total
    self.total_leave_balance = self.get_leave_balance
    self.total_pay = self.get_pay
    self.save
  end
  
  def get_previous_paycheck
    self.employee.paychecks.find(:first, conditions: ["start_at < ?",self.start_at], order: "start_at desc")
  end
  
end
