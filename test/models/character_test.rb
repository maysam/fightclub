require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  test "user should have balanced capabilities" do
    character = characters :one

    character.life_point = Character::MINIMUM_LIFE_POINT
    character.attack_point = Character::MINIMUM_ATTACK_POINT
    character.defence_point = Character::MINIMUM_DEFENCE_POINT

    refute character.valid?


    character.life_point = Character::MAXIMUM_LIFE_POINT
    character.attack_point = Character::MAXIMUM_ATTACK_POINT
    character.defence_point = Character::MAXIMUM_DEFENCE_POINT

    refute character.valid?

    character.life_point = (Character::MINIMUM_LIFE_POINT + Character::MAXIMUM_LIFE_POINT) / 2
    character.attack_point = (Character::MINIMUM_ATTACK_POINT + Character::MAXIMUM_ATTACK_POINT) / 2
    character.defence_point = (Character::MINIMUM_DEFENCE_POINT + Character::MAXIMUM_DEFENCE_POINT) / 2

    assert character.valid?
  end

  test "life point should be between #{Character::MINIMUM_LIFE_POINT} and #{Character::MAXIMUM_LIFE_POINT}" do
    character = characters :one

    character.life_point = Character::MINIMUM_LIFE_POINT - 1
    refute character.valid?

    character.life_point = Character::MAXIMUM_LIFE_POINT + 1
    refute character.valid?

    character.life_point = Character::MINIMUM_LIFE_POINT + (Character::MAXIMUM_LIFE_POINT - Character::MINIMUM_LIFE_POINT) / 2.0
    assert character.valid?
  end

  test "attack point should be between #{Character::MINIMUM_ATTACK_POINT} and #{Character::MAXIMUM_ATTACK_POINT}" do
    character = characters :one

    character.attack_point = Character::MINIMUM_ATTACK_POINT - 1
    refute character.valid?

    character.attack_point = Character::MAXIMUM_ATTACK_POINT + 1
    refute character.valid?

    character.attack_point = Character::MINIMUM_ATTACK_POINT + (Character::MAXIMUM_ATTACK_POINT - Character::MINIMUM_ATTACK_POINT) / 2.0
    assert character.valid?
  end

  test "defence point should be between #{Character::MINIMUM_DEFENCE_POINT} and #{Character::MAXIMUM_DEFENCE_POINT}" do
    character = characters :one

    character.defence_point = Character::MINIMUM_DEFENCE_POINT - 1
    refute character.valid?

    character.defence_point = Character::MAXIMUM_DEFENCE_POINT + 1
    refute character.valid?

    character.defence_point = Character::MINIMUM_DEFENCE_POINT + (Character::MAXIMUM_DEFENCE_POINT - Character::MINIMUM_DEFENCE_POINT) / 2.0
    assert character.valid?
  end
end
