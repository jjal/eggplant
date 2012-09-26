class CreateNotesPayRates < ActiveRecord::Migration
  def change
    create_table :notes_pay_rates do |t|
      t.integer :note_id
      t.integer :payrate_id

      t.timestamps
    end
  end
end
