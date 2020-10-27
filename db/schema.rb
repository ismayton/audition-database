# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_27_193010) do

  create_table "composers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "excerpts", force: :cascade do |t|
    t.string "description"
    t.integer "piece_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["piece_id"], name: "index_excerpts_on_piece_id"
  end

  create_table "excerpts_lists", id: false, force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "excerpt_id", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lists", force: :cascade do |t|
    t.date "date"
    t.integer "position_id"
    t.integer "orchestra_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orchestra_id"], name: "index_lists_on_orchestra_id"
    t.index ["position_id"], name: "index_lists_on_position_id"
  end

  create_table "lists_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "list_id", null: false
  end

  create_table "orchestras", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orchestras_positions", id: false, force: :cascade do |t|
    t.integer "orchestra_id", null: false
    t.integer "position_id", null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.string "version"
    t.integer "composer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composer_id"], name: "index_pieces_on_composer_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.integer "instrument_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instrument_id"], name: "index_positions_on_instrument_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
  end

  add_foreign_key "excerpts", "pieces"
  add_foreign_key "lists", "orchestras"
  add_foreign_key "lists", "positions"
  add_foreign_key "pieces", "composers"
  add_foreign_key "positions", "instruments"
end
