class SetEmployeeDatedeactivated < ActiveRecord::Migration
  def up
    Employee.find(:all, conditions: { status: "X" }).each do |e|
      e.datedeactivated = e.updated_at
      e.save!
    end
  end

  def down
  end
end
