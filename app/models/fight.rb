class Fight < ApplicationRecord
  belongs_to :winner, class_name: 'Character'
  belongs_to :loser, class_name: 'Character'

  has_many :logs
end
