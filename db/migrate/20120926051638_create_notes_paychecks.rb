class CreateNotesPaychecks < ActiveRecord::Migration
  def change
    create_table :notes_paychecks do |t|
      t.integer :note_id
      t.integer :paycheck_id

      t.timestamps
    end
  end
end
