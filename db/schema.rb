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

ActiveRecord::Schema.define(version: 20150304025625) do

  create_table "commits", force: :cascade do |t|
    t.text     "event_id"
    t.string   "sha"
    t.text     "message"
    t.text     "url"
    t.datetime "commit_timestamp"
    t.integer  "student_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "github_user"
    t.string   "tiy_campus"
    t.string   "tiy_course"
    t.date     "tiy_start_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
