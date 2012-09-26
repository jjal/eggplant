class CreateWorkedShifts < ActiveRecord::Migration
  def change
    create_table :worked_shifts do |t|
      t.integer :id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :employee_id

      t.timestamps
    end
  end
end
