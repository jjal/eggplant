class AddFteToPaychecks < ActiveRecord::Migration
  def change
    add_column :paychecks, :fte, :decimal
  end
end
