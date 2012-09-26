class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :id
      t.integer :user_id
      t.string :content
      t.integer :adjustment_id

      t.timestamps
    end
  end
end
