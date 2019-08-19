class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :life_point
      t.integer :attack_point
      t.integer :defence_point

      t.timestamps
    end
  end
end
