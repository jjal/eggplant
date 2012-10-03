class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.integer :id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :employee_id

      t.timestamps
    end
  end
end
