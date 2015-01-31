# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150131184502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: true do |t|
    t.integer  "product_id"
    t.string   "hue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_images", force: true do |t|
    t.integer  "product_id"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_images", ["product_id", "user_id", "image"], name: "index_product_images_on_product_id_and_user_id_and_image", using: :btree

  create_table "products", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "style_number"
    t.decimal  "shipping_cost", precision: 19, scale: 2
    t.integer  "user_id"
  end

  add_index "products", ["name", "user_id", "style_number"], name: "index_products_on_name_and_user_id_and_style_number", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "sizes", force: true do |t|
    t.string   "measurement"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skus", force: true do |t|
    t.integer  "product_id"
    t.integer  "color_id"
    t.integer  "size_id"
    t.integer  "inventory"
    t.decimal  "price_per_unit"
    t.date     "date_available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "seller_address_1"
    t.string   "seller_address_2"
    t.string   "seller_city"
    t.string   "seller_state"
    t.string   "seller_zipcode"
    t.string   "seller_telephone"
    t.string   "seller_tax_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "buyer_ship_to_address_1"
    t.string   "buyer_ship_to_address_2"
    t.string   "buyer_ship_to_address_3"
    t.string   "buyer_ship_to_city"
    t.string   "buyer_ship_to_state"
    t.string   "buyer_ship_to_zip"
    t.string   "buyer_sold_to_address_1"
    t.string   "buyer_sold_to_address_2"
    t.string   "buyer_sold_to_address_3"
    t.string   "buyer_sold_to_city"
    t.string   "buyer_sold_to_state"
    t.string   "buyer_sold_to_zip"
    t.string   "buyer_phone"
    t.string   "buyer_name"
    t.string   "company_name"
    t.text     "company_description"
    t.string   "logo"
  end

  add_index "users", ["buyer_ship_to_address_1", "buyer_ship_to_address_2", "buyer_ship_to_address_3", "buyer_ship_to_city", "buyer_ship_to_state", "buyer_ship_to_zip", "email", "buyer_sold_to_address_1", "buyer_sold_to_address_2", "buyer_sold_to_address_3", "buyer_sold_to_city", "buyer_sold_to_state", "buyer_sold_to_zip"], name: ":buyer_address_index", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["seller_address_1", "seller_address_2", "seller_city", "seller_state", "seller_zipcode", "seller_telephone", "email"], name: "seller_address_index", using: :btree

end
