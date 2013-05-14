class AddDatedeactivatedToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :datedeactivated, :date
  end
end
