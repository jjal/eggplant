class CostCenter < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :pay_rates
  
  CAFE = 1
  SOKSABIKE = 2
  KINYEI = 3
  
end
