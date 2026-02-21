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

ActiveRecord::Schema[8.0].define(version: 2025_08_02_011806) do
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

  create_table "condiment_amts", force: :cascade do |t|
    t.boolean "small"
    t.boolean "medium"
    t.boolean "large"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "condiments", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.boolean "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "food_items_id", null: false
    t.index ["food_items_id"], name: "index_condiments_on_food_items_id"
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "image"
    t.string "category"
    t.string "size"
    t.integer "food_id", null: false
    t.integer "condiments_id"
    t.index ["condiments_id"], name: "index_food_items_on_condiments_id"
    t.index ["food_id"], name: "index_food_items_on_food_id"
  end

  create_table "food_types", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.decimal "price"
    t.binary "image"
    t.string "size"
    t.integer "food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "food_types_id"
    t.index ["food_id"], name: "index_food_types_on_food_id"
  end

  create_table "foods", force: :cascade do |t|
    t.binary "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.integer "food_id"
    t.index ["category"], name: "index_foods_on_category", unique: true
    t.index ["food_id"], name: "index_foods_on_food_id"
  end

  create_table "installs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "item_sizes", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.decimal "tax"
    t.decimal "total"
    t.integer "orderNumber"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "condiments", "food_items", column: "food_items_id"
  add_foreign_key "food_items", "condiments", column: "condiments_id"
  add_foreign_key "food_items", "foods"
  add_foreign_key "food_types", "foods"
end
