class CreateStyle < ActiveRecord::Migration[6.1]
  def up
    create_table :styles do |t|
      t.string :name, null: false
      t.string :path, null: false
      t.timestamps
    end
  end

  def down
    drop_table :styles
  end
end
