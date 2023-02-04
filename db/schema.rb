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

ActiveRecord::Schema[7.0].define(version: 2023_02_11_095255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.text "title"
    t.text "address"
    t.text "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_activities_on_category_id"
    t.index ["itinerary_id"], name: "index_activities_on_itinerary_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_favorites_on_itinerary_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.float "price"
    t.text "duration"
    t.bigint "user_id", null: false
    t.bigint "station_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
    t.boolean "sunny", default: false, null: false
    t.boolean "cloudy", default: false, null: false
    t.boolean "rainy", default: false, null: false
    t.boolean "restaurant", default: false, null: false
    t.boolean "culture", default: false, null: false
    t.boolean "drinks", default: false, null: false
    t.boolean "outdoor", default: false, null: false
    t.boolean "original", default: false, null: false
    t.index ["station_id"], name: "index_itineraries_on_station_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "user_id", null: false
    t.float "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_reviews_on_itinerary_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.text "name"
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
    t.text "first_name"
    t.text "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "categories"
  add_foreign_key "activities", "itineraries"
  add_foreign_key "favorites", "itineraries"
  add_foreign_key "favorites", "users"
  add_foreign_key "itineraries", "stations"
  add_foreign_key "itineraries", "users"
  add_foreign_key "reviews", "itineraries"
  add_foreign_key "reviews", "users"
end
