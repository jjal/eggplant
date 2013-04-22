class AddCostCenters < ActiveRecord::Migration
  def up
    ["Cafe", "Soksabike", "Kinyei International"].each do |cc|
      CostCenter.create!(name: cc)
    end
  end

  def down
    CostCenter.all.each do |cc|
      cc.destroy
    end
  end
end
