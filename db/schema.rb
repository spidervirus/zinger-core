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

ActiveRecord::Schema.define(version: 2020_11_05_184303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_sessions", primary_key: "token", id: :string, force: :cascade do |t|
    t.jsonb "meta", default: {}
    t.string "login_ip"
    t.string "user_agent"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_sessions_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobile"
    t.string "password_digest"
    t.integer "auth_mode", limit: 2
    t.integer "status", limit: 2, default: 1
    t.boolean "deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email"
    t.index ["mobile"], name: "index_customers_on_mobile"
  end

  create_table "shop_details", primary_key: "shop_id", id: :bigint, default: nil, force: :cascade do |t|
    t.json "address", default: {}
    t.string "telephone"
    t.string "mobile"
    t.time "opening_time"
    t.time "closing_time"
    t.string "cover_photos", array: true
    t.jsonb "payment", default: {}
    t.jsonb "meta", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.decimal "lat", precision: 10, scale: 8
    t.decimal "lng", precision: 11, scale: 8
    t.string "icon"
    t.string "tags"
    t.integer "status", limit: 2, default: 1
    t.boolean "deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
