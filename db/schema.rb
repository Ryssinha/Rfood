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

ActiveRecord::Schema[7.0].define(version: 2023_06_01_053546) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "addresses", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "public_place", limit: 255
    t.string "zip_code", limit: 8, null: false
    t.string "number", limit: 15, null: false
    t.string "neighborhood", limit: 255, null: false
    t.bigint "city_id", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference", limit: 255
    t.string "complement", limit: 255
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "administrators", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "number", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.integer "security_code", null: false
    t.integer "card_type", null: false
    t.date "expiration_date", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_cards_on_customer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_dishes", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "dish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "dish_id"], name: "index_categories_dishes_on_category_id_and_dish_id", unique: true
  end

  create_table "chefs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "address_id", null: false
    t.bigint "approver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_chefs_on_address_id"
    t.index ["approver_id"], name: "index_chefs_on_approver_id"
    t.index ["user_id"], name: "index_chefs_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.string "description", limit: 255
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.decimal "total_discount", precision: 8, scale: 2, null: false
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_coupons_on_creator_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.bigint "chef_id", null: false
    t.string "name", limit: 255, null: false
    t.boolean "available", default: false, null: false
    t.boolean "active", default: false, null: false
    t.decimal "unit_price", precision: 8, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chef_id"], name: "index_dishes_on_chef_id"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "dish_id", null: false
    t.integer "amount", default: 1, null: false
    t.decimal "unit_price", precision: 8, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_order_items_on_dish_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "delivery_address_id", null: false
    t.decimal "total_price", precision: 8, scale: 2, default: "0.0", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "freight_price", precision: 8, scale: 2, default: "0.0", null: false
    t.bigint "coupon_id"
    t.index ["coupon_id"], name: "index_orders_on_coupon_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["delivery_address_id"], name: "index_orders_on_delivery_address_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "payment_type", null: false
    t.string "state", null: false
    t.bigint "order_id", null: false
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_payments_on_card_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "acronym", limit: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telephones", force: :cascade do |t|
    t.string "number", limit: 11, null: false
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_telephones_on_contactable"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "cpf", limit: 11, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "cities"
  add_foreign_key "administrators", "users"
  add_foreign_key "cards", "customers"
  add_foreign_key "chefs", "addresses"
  add_foreign_key "chefs", "administrators", column: "approver_id"
  add_foreign_key "chefs", "users"
  add_foreign_key "cities", "states"
  add_foreign_key "coupons", "administrators", column: "creator_id"
  add_foreign_key "customers", "users"
  add_foreign_key "dishes", "chefs"
  add_foreign_key "order_items", "dishes"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "addresses", column: "delivery_address_id"
  add_foreign_key "orders", "coupons"
  add_foreign_key "orders", "customers"
  add_foreign_key "payments", "cards"
  add_foreign_key "payments", "orders"
end
