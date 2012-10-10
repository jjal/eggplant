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
    self.leaves.sum('end_at - start_at', conditions: { start_at: start_date..end_date } ).to_f
  end
  
  def current_paycheck(*args)
    start_date = args[0] || current_pay_period.first
    end_date = args[1] || current_pay_period.last
    
    paycheck = self.paychecks.find(:first, conditions: { start_at: start_date..end_date })
    if(paycheck.nil?)
      paycheck = self.paychecks.build(start_at: start_date, end_at: end_date)
      paycheck.save!
    end
    return paycheck
  end
  
  def get_old_leave
    #todo
    return 0
  end
end
