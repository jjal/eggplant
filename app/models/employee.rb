class Employee < ActiveRecord::Base
  attr_accessible :name
  belongs_to :pay_rate
  has_many :worked_shifts
end
