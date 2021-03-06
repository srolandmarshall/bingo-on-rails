# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_22_182508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bingo_cards", force: :cascade do |t|
    t.boolean "winner", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bingo_cards_games", id: false, force: :cascade do |t|
    t.bigint "bingo_card_id", null: false
    t.bigint "bingo_game_id", null: false
    t.index ["bingo_card_id", "bingo_game_id"], name: "index_bingo_cards_games_on_bingo_card_id_and_bingo_game_id"
    t.index ["bingo_game_id", "bingo_card_id"], name: "index_bingo_cards_games_on_bingo_game_id_and_bingo_card_id"
  end

  create_table "bingo_cards_numbers", id: false, force: :cascade do |t|
    t.bigint "bingo_card_id", null: false
    t.bigint "bingo_number_id", null: false
    t.index ["bingo_card_id", "bingo_number_id"], name: "index_bingo_cards_numbers_on_bingo_card_id_and_bingo_number_id"
    t.index ["bingo_number_id", "bingo_card_id"], name: "index_bingo_cards_numbers_on_bingo_number_id_and_bingo_card_id"
  end

  create_table "bingo_games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bingo_games_numbers", id: false, force: :cascade do |t|
    t.bigint "bingo_number_id", null: false
    t.bigint "bingo_game_id", null: false
    t.index ["bingo_game_id", "bingo_number_id"], name: "index_bingo_games_numbers_on_bingo_game_id_and_bingo_number_id"
    t.index ["bingo_number_id", "bingo_game_id"], name: "index_bingo_games_numbers_on_bingo_number_id_and_bingo_game_id"
  end

  create_table "bingo_numbers", force: :cascade do |t|
    t.integer "number"
    t.string "letter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
