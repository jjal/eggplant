class Paycheck < ActiveRecord::Base
  attr_accessible :delivered_at, :employee_id, :end_at, :id, :payrate_id, :prepared_at, :start_at, :status, :user_id, :fte
  belongs_to :employee
  belongs_to :pay_rate, foreign_key: :payrate_id
  has_many :adjustments
  
  def get_pay
    self.pay_rate.calculate_pay(self)
  end
  
  def get_leave
    self.pay_rate.calculate_leave(self)
  end
  
  def get_hours
    employee.get_worked_shift_total_for self.start_at, self.end_at
  end
  
  def get_adjustments
    return self.adjustments.sum(:pay)
  end 
  
  def get_leave_taken_total
    employee.get_leave_total_for self.start_at, self.end_at
  end
  
  def get_leave_balance
    employee.get_old_leave - employee.get_leave_total_for(self.start_at, self.end_at) + self.pay_rate.calculate_leave(self)
  end
  
end
