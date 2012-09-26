class CreatePaychecks < ActiveRecord::Migration
  def change
    create_table :paychecks do |t|
      t.integer :id
      t.datetime :start_at
      t.datetime :end_at
      t.string :status
      t.datetime :prepared_at
      t.datetime :delivered_at
      t.integer :employee_id
      t.integer :payrate_id
      t.integer :user_id

      t.timestamps
    end
  end
end
