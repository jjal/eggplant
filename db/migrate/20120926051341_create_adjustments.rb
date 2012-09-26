class CreateAdjustments < ActiveRecord::Migration
  def change
    create_table :adjustments do |t|
      t.integer :id
      t.decimal :pay
      t.decimal :leave
      t.integer :paycheck_id
      t.integer :user_id
      t.integer :note_id

      t.timestamps
    end
  end
end
