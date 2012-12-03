class Employee < ActiveRecord::Base
  include PaychecksHelper
  
  attr_accessible :name, :payrate_id
  belongs_to :pay_rate, foreign_key: :payrate_id
  has_many :worked_shifts
  has_many :paychecks
  has_many :leaves, class_name: "Leave"
  
  def get_worked_shift_total_for (start_date, end_date)
    total = 0
    self.worked_shifts.find(:all, conditions: { start_at: start_date..end_date } ).each do |shift|
      total += (shift.end_at - shift.start_at) / 1.hour
    end
    return total #return number of hours
  end
  
  def get_leave_total_for (start_date, end_date)
    total = 0
    self.leaves.find(:all, conditions: { start_at: start_date..end_date } ).each do |leave|
      total += (leave.end_at - leave.start_at) / 1.hour
    end
    return total #return number of hours
  end
  
  def get_old_leave (current_date)
    pc = self.paychecks.find(:first, conditions: ["start_at < ?",current_date] , order: "start_at DESC", select: "total_leave_balance")
    return pc.nil? ? 0 : pc.total_leave_balance
  end
  
  def current_paycheck(end_date)
    start_date = get_start_date_for(end_date, self.pay_rate.monthly?)
    end_date = get_end_date_for(end_date, self.pay_rate.monthly?)
    
    paycheck = self.paychecks.find(:first, conditions: { start_at: start_date..end_date })
    if(paycheck.nil?)
      paycheck = self.paychecks.build(start_at: start_date, end_at: end_date, payrate_id: self.payrate_id, fte: self.pay_rate.FTE)
      paycheck.save!
    end
    return paycheck
  end
  
  def current_pay_period
    current_pay_period(self)
  end
  
  def get_pay_period_leaves
    return self.leaves.find(:all, conditions: {start_at: self.current_pay_period})
  end
  
end
