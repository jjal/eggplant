class Employee < ActiveRecord::Base
  include PaychecksHelper
  attr_accessible :name, :payrate_id
  belongs_to :pay_rate, foreign_key: :payrate_id
  has_many :worked_shifts
  has_many :paychecks
  has_many :leaves, class_name: "Leave"
  
  def get_worked_shift_total (start_date, end_date)
    self.worked_shifts.sum('end_at - start_at', conditions: { start_at: start_date..end_date } )
  end
  
  def current_paycheck(*args)
    start_date = args[0] || current_pay_period.first
    end_date = args[1] || current_pay_period.last
    
    paycheck = self.paychecks.find(:first, conditions: { start_at: start_date..end_date })
    if(paycheck.nil?)
      paycheck = self.paychecks.build(start_at: start_date, end_at: end_date)
      paycheck.save!
    end
    return paycheck
  end
  
end
