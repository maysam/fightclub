# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_21_171301) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "life_point"
    t.integer "attack_point"
    t.integer "defence_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "experience_point", default: "0.0"
    t.decimal "win_rate", default: "0.0"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "winner_id"
    t.integer "loser_id"
    t.decimal "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loser_id"], name: "index_fights_on_loser_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "status"
    t.string "news"
    t.integer "fight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_id"], name: "index_logs_on_fight_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.string "weapon_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_weapons_on_name", unique: true
  end

end
