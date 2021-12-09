class CreateUser < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      t.string :login, null: false
      t.string :password, null: false
      t.integer :styles_count, default: 0
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
