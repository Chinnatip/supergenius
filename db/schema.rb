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

ActiveRecord::Schema.define(version: 20200424062927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addcourses", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "course"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "add_type"
  end

  create_table "analysts", id: :serial, force: :cascade do |t|
    t.string "company"
    t.string "name"
    t.string "tel"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "volumn"
  end

  create_table "booking_reasons", id: :serial, force: :cascade do |t|
    t.string "reason"
    t.string "ref_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_weeks", id: :serial, force: :cascade do |t|
    t.string "week"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", id: :serial, force: :cascade do |t|
    t.text "name"
    t.string "spec"
    t.integer "course"
    t.string "teacher"
    t.integer "seat"
    t.integer "booked"
    t.integer "pass"
    t.string "status"
    t.integer "schedule"
    t.datetime "start"
    t.datetime "end"
    t.float "price"
    t.time "start_time"
    t.time "end_time"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "period"
    t.string "old_link"
    t.string "current"
    t.text "desc"
    t.string "max_score"
  end

  create_table "cms", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "tagid"
    t.text "content"
    t.integer "viewer"
    t.string "seo_title"
    t.text "seo_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map"
    t.text "word_pool"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.string "classroom"
    t.string "period"
    t.string "student"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "configs", id: :serial, force: :cascade do |t|
    t.integer "current_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_semester"
  end

  create_table "configurs", id: :serial, force: :cascade do |t|
    t.text "top_contact"
    t.string "company_name"
    t.text "contact_info"
    t.text "home_slider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_schedules", id: :serial, force: :cascade do |t|
    t.string "student_id"
    t.string "course"
    t.datetime "live_date"
    t.datetime "attend_start"
    t.datetime "attend_finish"
    t.string "attent_hour"
    t.string "attend_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ref_code"
    t.string "attend_seat"
  end

  create_table "courses", id: :serial, force: :cascade do |t|
    t.text "name"
    t.string "major"
    t.float "price"
    t.integer "grade"
    t.integer "seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "semester"
    t.string "session_id"
    t.datetime "start"
    t.datetime "end"
    t.time "start_time"
    t.time "end_time"
    t.string "time_table"
    t.integer "period"
    t.string "teacher"
    t.text "note"
  end

  create_table "employees", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", id: :serial, force: :cascade do |t|
    t.string "student"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "classroom"
    t.integer "period"
    t.string "exam_type"
  end

  create_table "majors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "major_id"
    t.string "major_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.string "image"
    t.text "writer"
    t.string "status"
    t.text "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "viewer"
    t.string "newstype"
  end

  create_table "newsfeeds", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.string "writer"
    t.string "image"
    t.string "status"
    t.string "link"
    t.integer "viewer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "newstype"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "desc"
    t.integer "price"
    t.string "image"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", id: :serial, force: :cascade do |t|
    t.text "title"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registers", id: :serial, force: :cascade do |t|
    t.string "course"
    t.string "student"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "school_programs", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", id: :serial, force: :cascade do |t|
    t.text "name"
    t.integer "student"
    t.integer "graduated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", id: :serial, force: :cascade do |t|
    t.string "classroom"
    t.string "student"
    t.string "status"
    t.integer "checkin"
    t.string "valuate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
  end

  create_table "semesters", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.text "description"
    t.integer "course_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sem_code"
    t.string "sem_index"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "surname"
    t.integer "grade"
    t.text "school"
    t.text "parent"
    t.string "email"
    t.string "tel"
    t.string "line"
    t.string "facebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "student_code"
    t.string "username"
    t.string "password"
    t.string "secret_id"
    t.string "gender"
    t.string "tel_parent"
    t.string "birthday"
    t.string "school_primary"
    t.string "school_secondary"
    t.string "school_university"
    t.string "school_program"
    t.boolean "substitude", default: false
  end

  create_table "teachers", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "surname"
    t.string "major"
    t.string "email"
    t.string "tel"
    t.text "graduate"
    t.float "gpa"
    t.string "line"
    t.string "facebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.text "note"
    t.string "password"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.boolean "is_super_admin"
    t.string "password"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
