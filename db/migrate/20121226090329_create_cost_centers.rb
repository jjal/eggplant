class CreateCostCenters < ActiveRecord::Migration
  def change
    create_table :cost_centers do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
