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

ActiveRecord::Schema[7.0].define(version: 2022_04_06_012403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "height"
    t.integer "weight"
    t.decimal "price", precision: 15, scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "base_experience"
    t.decimal "last_sell_price", precision: 15, scale: 2
    t.index ["user_id"], name: "index_pokemons_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "pokemon_id"
    t.decimal "amount", precision: 15, scale: 2
    t.index ["pokemon_id"], name: "index_transactions_on_pokemon_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password"
    t.decimal "balance", precision: 20, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pokemons", "users"
  add_foreign_key "transactions", "pokemons"
  add_foreign_key "transactions", "users"
end
