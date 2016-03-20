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

ActiveRecord::Schema.define(version: 20150930181607) do

  create_table "days", force: true do |t|
    t.text     "description"
    t.integer  "number"
    t.integer  "goal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "days", ["goal_id"], name: "index_days_on_goal_id"

  create_table "goals", force: true do |t|
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: true do |t|
    t.integer  "goal_id"
    t.integer  "user_id"
    t.integer  "current_day"
    t.string   "days_completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["goal_id"], name: "index_tracks_on_goal_id"
  add_index "tracks", ["user_id"], name: "index_tracks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
