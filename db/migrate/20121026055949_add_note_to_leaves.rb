class AddNoteToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :note, :string
  end
end
