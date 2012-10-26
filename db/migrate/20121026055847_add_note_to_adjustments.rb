class AddNoteToAdjustments < ActiveRecord::Migration
  def change
    add_column :adjustments, :note, :string
  end
end
