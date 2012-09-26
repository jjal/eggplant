class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :name
      t.string :encrypted_password
      t.integer :employee_id

      t.timestamps
    end
  end
end
