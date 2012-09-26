class CreatePayRates < ActiveRecord::Migration
  def change
    create_table :pay_rates do |t|
      t.integer :id
      t.string :type
      t.string :name
      t.decimal :hourly_rate
      t.decimal :monthly_rate
      t.decimal :FTE

      t.timestamps
    end
  end
end
