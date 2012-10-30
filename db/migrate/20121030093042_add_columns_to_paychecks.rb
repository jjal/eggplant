class AddColumnsToPaychecks < ActiveRecord::Migration
  def change
    add_column :paychecks, :total_adjustments_pay, :decimal
    add_column :paychecks, :total_adjustments_leave, :decimal
    add_column :paychecks, :total_hours, :integer
    add_column :paychecks, :total_leave, :decimal
    add_column :paychecks, :total_leave_taken, :decimal
    add_column :paychecks, :total_leave_balance, :decimal
    add_column :paychecks, :total_pay, :decimal
  end
end
