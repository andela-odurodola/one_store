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

ActiveRecord::Schema.define(version: 20171020091212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_favourites_on_book_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "rent_histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "date_returned"
    t.datetime "date_borrowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "borrow_status"
    t.string "rent_status"
    t.index ["book_id"], name: "index_rent_histories_on_book_id"
    t.index ["user_id"], name: "index_rent_histories_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.string "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
  end

  add_foreign_key "favourites", "books"
  add_foreign_key "favourites", "users"
  add_foreign_key "rent_histories", "books"
  add_foreign_key "rent_histories", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
