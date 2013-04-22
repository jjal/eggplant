class AddMonthlyToPayRates < ActiveRecord::Migration
  def change
    add_column :pay_rates, :monthly, :boolean
  end
end
