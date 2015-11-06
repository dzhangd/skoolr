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

ActiveRecord::Schema.define(version: 20151105212846) do

  create_table "grades", force: :cascade do |t|
    t.string   "subject"
    t.integer  "grade"
    t.integer  "average_mark"
    t.integer  "school_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "grades", ["school_id"], name: "index_grades_on_school_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "school_year"
    t.string   "question"
    t.string   "grade_group"
    t.integer  "non_excluded_responses"
    t.integer  "many_or_all_responses"
    t.integer  "many_or_all_pct"
    t.integer  "at_no_time_responses"
    t.integer  "at_no_time_pct"
    t.integer  "few_times_responses"
    t.integer  "few_times_pct"
    t.integer  "some_times_responses"
    t.integer  "some_times_pct"
    t.integer  "school_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "surveys", ["school_id"], name: "index_surveys_on_school_id"

end
