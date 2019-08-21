class Weapon < ApplicationRecord
  WEAPON = 'weapon'
  SHIELD = 'shield'

  validates :name, presence: true, uniqueness: true
end
