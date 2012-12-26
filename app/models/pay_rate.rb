class PayRate < ActiveRecord::Base
  attr_accessible :FTE, :hourly_rate, :id, :monthly_rate, :name, :type, :monthly, :cost_center_id
  has_many :employees, foreign_key: :payrate_id
  belongs_to :cost_center
  HOURLY_LEAVE_EARNED = 0.07
  TYPES = ["PermanentPayRate","CasualPayRate"]
  
  S_OPERATIONS_MGR = 1
  S_MECHANIC = 2
  C_BUSINESS_MGR = 3
  C_OPERATIONS_MGR = 4
  C_SUPERVISOR = 5
  C_KITCHEN_SUPERVISOR = 6
  C_STAFF_CASUAL = 7
  C_STAFF_CASUAL_ENTRY = 8
  C_STAFF_PERMANENT_ENTRY = 9
  C_STAFF_PERMANENT_ENTRY_PROBATION = 10
  O_STAFF_ENTRY = 11
  S_ASSISTANT = 12
  C_STAFF_PERMANENT = 13
  
  def calculate_leave(paycheck)
    paycheck.get_hours * HOURLY_LEAVE_EARNED
  end
  
  def calculate_pay(paycheck)
    0
  end
end