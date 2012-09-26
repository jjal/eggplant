class WorkedShift < ActiveRecord::Base
  attr_accessible :employee_id, :end_at, :id, :start_at
  belongs_to :employee
end
