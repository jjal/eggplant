class PayRate < ActiveRecord::Base
  attr_accessible :FTE, :hourly_rate, :id, :monthly_rate, :name, :type
  has_many :employees
  HOURLY_LEAVE_EARNED = 0.75
  
  def calculate_leave(paycheck)
    paycheck.get_hours * HOURLY_LEAVE_EARNED
  end
  
  def calculate_pay(paycheck)
    0
  end
end