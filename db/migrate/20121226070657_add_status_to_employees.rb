class AddStatusToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :status, :string, default: "A"
  end
end
