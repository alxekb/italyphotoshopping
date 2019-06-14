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

ActiveRecord::Schema.define(version: 2019_06_14_135650) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bulletins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "wa"
    t.string "ig"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "item_id"
    t.decimal "bye"
    t.decimal "sell"
    t.string "status"
    t.string "messenger"
    t.boolean "paid"
    t.boolean "ransom"
    t.text "comment"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "h"
    t.integer "w"
    t.integer "l"
    t.integer "weight"
    t.bigint "package_id"
    t.index ["item_id"], name: "index_deals_on_item_id"
    t.index ["package_id"], name: "index_deals_on_package_id"
    t.index ["profile_id"], name: "index_deals_on_profile_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "item_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item"
    t.string "brand"
    t.string "name"
    t.string "color"
    t.string "size"
    t.bigint "ean"
    t.bigint "art"
    t.float "price"
    t.integer "discount"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.json "photos"
    t.integer "model_id"
    t.integer "user_id"
    t.string "slug"
    t.integer "eur_price"
    t.bigint "brand_id"
    t.bigint "size_id"
    t.bigint "color_id"
    t.bigint "item_name_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["color_id"], name: "index_items_on_color_id"
    t.index ["item_name_id"], name: "index_items_on_item_name_id"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["slug"], name: "index_items_on_slug", unique: true
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_status"
    t.string "tracking_number"
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "packages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.integer "shipping_type"
    t.integer "pup_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "h"
    t.integer "w"
    t.integer "l"
    t.integer "weight"
    t.bigint "package_id"
    t.string "tracking_code"
    t.string "shipping_status"
    t.boolean "active"
    t.bigint "profile_id"
    t.index ["item_id"], name: "index_packages_on_item_id"
    t.index ["package_id"], name: "index_packages_on_package_id"
    t.index ["profile_id"], name: "index_packages_on_profile_id"
    t.index ["user_id"], name: "index_packages_on_user_id"
  end

  create_table "profile_deals", force: :cascade do |t|
    t.bigint "client_id"
    t.boolean "byed"
    t.boolean "paid"
    t.string "messenger"
    t.bigint "item_id"
    t.integer "buy"
    t.integer "sell"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_profile_deals_on_client_id"
    t.index ["item_id"], name: "index_profile_deals_on_item_id"
  end

  create_table "profile_items", force: :cascade do |t|
    t.string "item"
    t.string "brand"
    t.string "color"
    t.integer "price"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "second_name"
    t.string "surname"
    t.bigint "phone"
    t.integer "country_code"
    t.string "email"
    t.integer "passport_code"
    t.bigint "passport_number"
    t.date "passport_date_issue"
    t.string "passport_issuer"
    t.integer "notification_number"
    t.integer "notification_code"
    t.integer "inn"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "boxberry_office_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "index"
    t.string "new"
    t.string "edit"
    t.string "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deals", "items"
  add_foreign_key "deals", "packages"
  add_foreign_key "deals", "profiles"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "colors"
  add_foreign_key "items", "item_names"
  add_foreign_key "items", "sizes"
  add_foreign_key "packages", "items"
  add_foreign_key "packages", "packages"
  add_foreign_key "packages", "profiles"
end
