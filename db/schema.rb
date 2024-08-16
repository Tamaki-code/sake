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

ActiveRecord::Schema[7.0].define(version: 2024_08_13_052108) do
  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sake_id", null: false
    t.integer "rating"
    t.decimal "sweetness"
    t.decimal "spiciness"
    t.decimal "lightness"
    t.decimal "richness"
    t.string "aroma"
    t.string "aftertaste"
    t.string "drinking_style"
    t.string "matching_food"
    t.text "comment"
    t.string "image"
    t.date "recorded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sake_id"], name: "index_reviews_on_sake_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sake_reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "bundle"
    t.string "install"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sake_reviews_on_user_id"
  end

  create_table "sakes", force: :cascade do |t|
    t.string "sakenowaId"
    t.string "brand"
    t.string "brewery"
    t.string "prefecture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "gender"
    t.date "birthdate"
    t.text "comment"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reviews", "sakes"
  add_foreign_key "reviews", "users"
  add_foreign_key "sake_reviews", "users"
end
