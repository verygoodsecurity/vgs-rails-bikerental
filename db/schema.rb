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

ActiveRecord::Schema.define(version: 20180628202522) do

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "account_number"
    t.string   "routing_number"
    t.string   "name"
    t.string   "account_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "bank_accounts", ["user_id"], name: "index_bank_accounts_on_user_id"

  create_table "listings", force: :cascade do |t|
    t.integer  "bicycle_id"
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.string   "bicycle_type"
    t.integer  "user_id"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_cards", force: :cascade do |t|
    t.string   "card_number",      limit: 19
    t.integer  "expiration_year"
    t.integer  "expiration_month"
    t.integer  "security_code"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
  end

  add_index "payment_cards", ["user_id"], name: "index_payment_cards_on_user_id"

  create_table "rentals", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "buyer_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_href"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_href"
    t.string   "name"
    t.string   "bank_account_href"
  end

  add_index "users", ["customer_href"], name: "index_users_on_customer_href"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
