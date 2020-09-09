class CreateNotes < ActiveRecord::Migration
  def up
    create_table :notes do |t|
      t.integer :user_id, null: false
      t.text :description
      t.boolean :important, default: false
      t.boolean :private_note, default: true
      t.timestamps
    end
  end

  def down
    drop_table notes
  end
end
