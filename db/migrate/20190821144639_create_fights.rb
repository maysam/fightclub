class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :winner
      t.references :loser
      t.decimal :points, limit: 2

      t.timestamps
    end

    create_table :logs do |t|
      t.string :status
      t.string :news
      t.references :fight, foreign_key: true

      t.timestamps
    end
  end
end
