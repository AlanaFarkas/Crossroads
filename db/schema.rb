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

ActiveRecord::Schema.define(version: 20160602193926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address_1",  null: false
    t.string   "address_2"
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "zip",        null: false
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "establishments", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "address_1",    null: false
    t.string   "address_2"
    t.string   "city",         null: false
    t.string   "state",        null: false
    t.string   "zip",          null: false
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "establishment_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "favorites", ["establishment_id"], name: "index_favorites_on_establishment_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "phone_number"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "favorites", "establishments"
  add_foreign_key "favorites", "users"
end
