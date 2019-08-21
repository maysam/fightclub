class Character < ApplicationRecord
  MINIMUM_LIFE_POINT = 1
  MAXIMUM_LIFE_POINT = 10

  MINIMUM_ATTACK_POINT = 1
  MAXIMUM_ATTACK_POINT = 10

  MINIMUM_DEFENCE_POINT = 1
  MAXIMUM_DEFENCE_POINT = 10

  AVERAGE_MAX = (MAXIMUM_LIFE_POINT + MAXIMUM_ATTACK_POINT + MAXIMUM_DEFENCE_POINT) / 3.0
  AVERAGE_MIN = (MINIMUM_LIFE_POINT + MINIMUM_ATTACK_POINT + MINIMUM_DEFENCE_POINT) / 3.0

  AVERAGE_POINTS = (AVERAGE_MAX - AVERAGE_MIN) / 2.0

  UPPER_LIMIT = (AVERAGE_MAX + AVERAGE_POINTS) / 2.0
  LOWER_LIMIT = (AVERAGE_MIN + AVERAGE_POINTS) / 2.0

  validates :name, presence: true, uniqueness: true
  validate :points_are_in_range
  validate :balanced?

  def points_are_in_range
    unless life_point&.between?(MINIMUM_LIFE_POINT, MAXIMUM_LIFE_POINT)
      errors.add(:life_point, "should be between #{MINIMUM_LIFE_POINT} and #{MAXIMUM_LIFE_POINT}")
    end
    unless attack_point&.between?(MINIMUM_ATTACK_POINT, MAXIMUM_ATTACK_POINT)
      errors.add(:attack_point, "should be between #{MINIMUM_ATTACK_POINT} and #{MAXIMUM_ATTACK_POINT}")
    end
    unless defence_point&.between?(MINIMUM_DEFENCE_POINT, MAXIMUM_DEFENCE_POINT)
      errors.add(:defence_point, "should be between #{MINIMUM_DEFENCE_POINT} and #{MAXIMUM_DEFENCE_POINT}")
    end
  end

  def balanced?
    return unless errors.empty?

    average_points = (life_point + attack_point + defence_point)/3.0
    if average_points > UPPER_LIMIT
      errors.add(:character, 'is too strong')
    end
    if average_points < LOWER_LIMIT
      errors.add(:character, 'is too weak')
    end
  end

  def avatar
    "https://randomuser.me/api/portraits/med/#{id%2 == 0 ? 'women' : 'men'}/#{id%100}.jpg"
  end

  def attack(opponent)
    log = []
    attack_force = (attack_point * rand).round(2)
    log << {info: "#{self} attacks #{opponent} with #{attack_force} force" }
    defence_force = (opponent.defence_point * rand).round(2)
    # log << {info: "#{opponent} defending with #{defence_force} force"}
    if attack_force > defence_force
      damage = (attack_force - defence_force).round(2)
      log << {danger: "#{opponent} suffered #{damage} points"}
      opponent.life_point -= damage
    else
      log << {warning: "#{opponent} didn't feel anything"}
    end
    log
  end

  def to_s
    "<b>#{name}</b>"
  end
end
