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

ActiveRecord::Schema.define(version: 20150507144102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts_users", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "contacts_users", ["contact_id"], name: "index_contacts_users_on_contact_id", using: :btree
  add_index "contacts_users", ["user_id"], name: "index_contacts_users_on_user_id", using: :btree

  create_table "texts", force: :cascade do |t|
    t.string   "content"
    t.integer  "from_number"
    t.integer  "to_number"
    t.integer  "user_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "phone_number"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
