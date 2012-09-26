class AddPayrateIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :payrate_id, :integer
  end
end
