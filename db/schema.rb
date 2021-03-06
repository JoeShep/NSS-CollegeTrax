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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130526091200) do

  create_table "rankings", :force => true do |t|
    t.float   "dorms"
    t.float   "campus"
    t.float   "food_campus"
    t.float   "food_off_campus"
    t.float   "majors"
    t.float   "town"
    t.float   "library"
    t.float   "students"
    t.float   "classrooms"
    t.float   "student_center"
    t.float   "intramural_sports"
    t.float   "other_activities"
    t.integer "visit_id"
    t.float   "diets"
    t.float   "overall"
  end

  create_table "visits", :force => true do |t|
    t.string "school_name"
    t.date   "visit_date"
    t.float  "ranking"
    t.string "contact_name"
    t.string "contat_email"
    t.string "contact_phone"
    t.text   "in_session"
    t.text   "tour"
    t.text   "interview"
    t.text   "info_session"
    t.text   "overnight"
    t.text   "class_visit"
  end

end
