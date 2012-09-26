class PayRate < ActiveRecord::Base
  attr_accessible :FTE, :hourly_rate, :id, :monthly_rate, :name, :type
  has_many :employees
end