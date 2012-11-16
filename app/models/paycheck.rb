class Paycheck < ActiveRecord::Base
  attr_accessible :delivered_at, :employee_id, :end_at, :id, :payrate_id, :prepared_at, :start_at, :status, :user_id, :fte
  belongs_to :employee
  belongs_to :pay_rate, foreign_key: :payrate_id
  has_many :adjustments
  
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
  
  def recount
    self.pay_rate = employee.pay_rate
    self.fte = pay_rate.FTE
    
    self.total_adjustments_pay = self.get_adjustments
    self.total_adjustments_leave = self.get_adjustments_leave
    self.total_hours = self.get_hours
    self.total_leave = self.get_leave
    self.total_leave_taken = self.get_leave_taken_total
    self.total_leave_balance = self.get_leave_balance
    self.total_pay = self.get_pay
  end
  
  def get_previous_paycheck
    self.employee.paychecks.find(:first, conditions: ["start_at < ?",self.start_at], order: "start_at desc")
  end
  
end
