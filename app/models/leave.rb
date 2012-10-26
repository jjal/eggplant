class Leave < ActiveRecord::Base
  attr_accessible :employee_id, :end_at, :id, :start_at, :note
  
  belongs_to :employee
  
  validates(:start_at, presence: true)
  validates(:end_at, presence: true)
end
