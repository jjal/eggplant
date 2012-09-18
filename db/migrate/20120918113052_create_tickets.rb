class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :table_number
      t.string :name

      t.timestamps
    end
  end
end
