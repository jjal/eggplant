class Adjustment < ActiveRecord::Base
  attr_accessible :id, :leave, :note_id, :pay, :paycheck_id, :user_id, :note
  belongs_to :paycheck
end
