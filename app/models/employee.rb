class Employee < ActiveRecord::Base
  attr_accessible :name, :payrate_id
  belongs_to :pay_rate, foreign_key: :payrate_id
  has_many :worked_shifts
end
