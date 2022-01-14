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

ActiveRecord::Schema.define(version: 2022_01_14_003049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bingo_cards", force: :cascade do |t|
    t.boolean "winner", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bingo_numbers_id", null: false
    t.index ["bingo_numbers_id"], name: "index_bingo_cards_on_bingo_numbers_id"
  end

  create_table "bingo_numbers", force: :cascade do |t|
    t.bigint "bingo_card_id"
    t.string "letter", null: false
    t.integer "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bingo_card_id"], name: "index_bingo_numbers_on_bingo_card_id"
  end

  add_foreign_key "bingo_cards", "bingo_numbers", column: "bingo_numbers_id"
  add_foreign_key "bingo_numbers", "bingo_cards"
end
