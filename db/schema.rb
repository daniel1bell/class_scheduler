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

ActiveRecord::Schema.define(:version => 20140501195248) do

  create_table "bookings", :force => true do |t|
    t.integer  "cohort_id"
    t.integer  "classroom_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "bookings", ["classroom_id"], :name => "index_bookings_on_classroom_id"
  add_index "bookings", ["cohort_id"], :name => "index_bookings_on_cohort_id"

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.integer  "capacity"
    t.text     "facilities"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "classrooms", ["location_id"], :name => "index_classrooms_on_location_id"

  create_table "cohorts", :force => true do |t|
    t.integer  "iteration"
    t.integer  "course_id"
    t.date     "start_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cohorts", ["course_id"], :name => "index_cohorts_on_course_id"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "instructors_req"
    t.integer  "duration_weeks"
    t.decimal  "price"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "cohort_id"
    t.boolean  "prework_done"
    t.decimal  "paid_amount"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "enrollments", ["cohort_id"], :name => "index_enrollments_on_cohort_id"
  add_index "enrollments", ["student_id"], :name => "index_enrollments_on_student_id"

  create_table "instructor_assignments", :force => true do |t|
    t.integer  "instructor_id"
    t.integer  "cohort_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "instructor_assignments", ["cohort_id"], :name => "index_instructor_assignments_on_cohort_id"
  add_index "instructor_assignments", ["instructor_id"], :name => "index_instructor_assignments_on_instructor_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.text     "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
