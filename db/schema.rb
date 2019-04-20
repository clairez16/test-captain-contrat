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

ActiveRecord::Schema.define(version: 2019_04_20_063203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipements", force: :cascade do |t|
    t.string "name"
    t.integer "attack_points", default: 0
    t.integer "defense_points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.integer "category", default: 0
    t.integer "life_points"
    t.integer "attack_points"
    t.integer "experience", default: 0
    t.integer "level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "winner_id"
    t.bigint "loser_id"
    t.bigint "fighter_1_id"
    t.bigint "fighter_2_id"
    t.bigint "equipement_1_id"
    t.bigint "equipement_2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipement_1_id"], name: "index_fights_on_equipement_1_id"
    t.index ["equipement_2_id"], name: "index_fights_on_equipement_2_id"
    t.index ["fighter_1_id"], name: "index_fights_on_fighter_1_id"
    t.index ["fighter_2_id"], name: "index_fights_on_fighter_2_id"
    t.index ["loser_id"], name: "index_fights_on_loser_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "strokes", force: :cascade do |t|
    t.bigint "fight_id"
    t.bigint "owner_id"
    t.bigint "target_id"
    t.integer "impact", default: 0
    t.boolean "missed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_id"], name: "index_strokes_on_fight_id"
    t.index ["owner_id"], name: "index_strokes_on_owner_id"
    t.index ["target_id"], name: "index_strokes_on_target_id"
  end

end
