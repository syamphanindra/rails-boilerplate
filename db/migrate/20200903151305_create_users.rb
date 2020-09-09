class CreateUsers < ActiveRecord::Migration

  def migrate(direction)
    self.send(direction)
  end

  def up
    create_table :users do |t|
      t.text :email, null: false
      t.text :first_name
      t.text :last_name
      t.text :age
      t.boolean :blocked_user, default: false
      t.integer :reputation
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
