class Employee < ActiveRecord::Base
  include PaychecksHelper
  attr_accessible :name, :payrate_id
  belongs_to :pay_rate, foreign_key: :payrate_id
  has_many :worked_shifts
  has_many :paychecks
  has_many :leaves
  
  def get_worked_shift_total (start_date, end_date)
    self.worked_shifts.sum('end_at - start_at', conditions: { start_at: start_date..end_date } )
  end
  
  def current_paycheck(start_date, end_date)
    self.paychecks.find(:first, conditions: { start_at: start_date..end_date })
  end
  
end
