class AddCostCenterIdToPayRates < ActiveRecord::Migration
  def change
    add_column :pay_rates, :cost_center_id, :integer
  end
end
