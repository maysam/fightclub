class AddStrikePointToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :experience_point, :decimal, limit: 2, default: 0
    add_column :characters, :win_rate, :decimal, limit: 2, default: 0
  end
end
