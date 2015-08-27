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

ActiveRecord::Schema.define(version: 20150827061034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_team_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_team_users", ["event_id"], name: "index_event_team_users_on_event_id", using: :btree
  add_index "event_team_users", ["team_id"], name: "index_event_team_users_on_team_id", using: :btree
  add_index "event_team_users", ["user_id"], name: "index_event_team_users_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_teams"
    t.integer  "max_team_members"
    t.integer  "min_team_members"
    t.integer  "owner_id"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "loc_note"
    t.string   "website"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "uid"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree
  add_index "teams", ["owner_id"], name: "index_teams_on_owner_id", using: :btree
  add_index "teams", ["uid"], name: "index_teams_on_uid", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "empl_num"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
