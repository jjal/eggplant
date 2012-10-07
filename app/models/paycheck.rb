class Paycheck < ActiveRecord::Base
  attr_accessible :delivered_at, :employee_id, :end_at, :id, :payrate_id, :prepared_at, :start_at, :status, :user_id
  belongs_to :employee
  has_many :adjustments
end
