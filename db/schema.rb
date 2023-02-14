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


ActiveRecord::Schema[7.0].define(version: 2023_02_14_190135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.text "title"
    t.text "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_activities_on_itinerary_id"
  end

  create_table "dashboards", force: :cascade do |t|
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
    t.string "price"
    t.string "duration"
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
    t.integer "rating"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "itineraries"
  add_foreign_key "favorites", "itineraries"
  add_foreign_key "favorites", "users"
  add_foreign_key "itineraries", "stations"
  add_foreign_key "itineraries", "users"
  add_foreign_key "reviews", "itineraries"
  add_foreign_key "reviews", "users"
end
