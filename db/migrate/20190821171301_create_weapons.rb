class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :points
      t.string :weapon_type

      t.timestamps
    end
    add_index :weapons, :name, unique: true
  end
end
