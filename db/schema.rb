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

ActiveRecord::Schema[7.0].define(version: 2023_01_02_150542) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "air_routes", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.time "departure_time"
    t.time "landing_time"
    t.boolean "is_direct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "airline_company_id"
    t.integer "tourist_route_id"
    t.index ["airline_company_id"], name: "index_air_routes_on_airline_company_id"
    t.index ["tourist_route_id"], name: "index_air_routes_on_tourist_route_id"
  end

  create_table "air_routes_tourist_routes", id: false, force: :cascade do |t|
    t.integer "air_route_id", null: false
    t.integer "tourist_route_id", null: false
  end

  create_table "airline_companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "votes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "view_times"
    t.integer "user_id"
    t.integer "tourist_route_id", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "blog_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["blog_id"], name: "index_comments_on_blog_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "types"
    t.integer "rate"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tourist_route_id"
    t.index ["tourist_route_id"], name: "index_hotels_on_tourist_route_id"
  end

  create_table "hotels_tourist_routes", id: false, force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.integer "tourist_route_id", null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.boolean "has_window"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotel_id"
    t.index ["hotel_id"], name: "index_room_types_on_hotel_id"
  end

  create_table "tourist_routes", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.integer "total_days"
    t.integer "cost"
    t.string "agency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blog_id"
    t.integer "user_id"
    t.integer "hotels_id"
    t.string "name", null: false
    t.index ["blog_id"], name: "index_tourist_routes_on_blog_id"
    t.index ["user_id"], name: "index_tourist_routes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "username"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "air_routes", "airline_companies"
  add_foreign_key "air_routes", "tourist_routes"
  add_foreign_key "comments", "blogs"
  add_foreign_key "hotels", "tourist_routes"
  add_foreign_key "room_types", "hotels"
  add_foreign_key "tourist_routes", "blogs"
end
