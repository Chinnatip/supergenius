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

ActiveRecord::Schema.define(version: 20170608100308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analysts", force: :cascade do |t|
    t.string   "company"
    t.string   "name"
    t.string   "tel"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.decimal  "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "volumn"
  end

  create_table "classrooms", force: :cascade do |t|
    t.text     "name"
    t.integer  "spec"
    t.integer  "course"
    t.integer  "teacher"
    t.integer  "seat"
    t.integer  "booked"
    t.integer  "pass"
    t.string   "status"
    t.integer  "schedule"
    t.datetime "start"
    t.datetime "end"
    t.float    "price"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.text     "name"
    t.string   "major"
    t.float    "price"
    t.integer  "grade"
    t.integer  "seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "ref_class"
    t.integer  "student"
    t.integer  "issue"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.string   "image"
    t.text     "writer"
    t.string   "status"
    t.text     "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "viewer"
    t.string   "newstype"
  end

  create_table "newsfeeds", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.string   "writer"
    t.string   "image"
    t.string   "status"
    t.string   "link"
    t.integer  "viewer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "newstype"
  end

  create_table "products", force: :cascade do |t|
    t.text     "name"
    t.text     "desc"
    t.integer  "price"
    t.string   "image"
    t.integer  "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.text     "title"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.text     "name"
    t.integer  "student"
    t.integer  "graduated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "classroom"
    t.integer  "student"
    t.string   "status"
    t.integer  "checkin"
    t.string   "valuate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.text     "name"
    t.text     "surname"
    t.integer  "grade"
    t.text     "school"
    t.text     "parent"
    t.string   "email"
    t.integer  "tel"
    t.string   "line"
    t.string   "facebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.text     "name"
    t.text     "surname"
    t.string   "major"
    t.string   "email"
    t.integer  "tel"
    t.text     "graduate"
    t.float    "gpa"
    t.string   "line"
    t.string   "facebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string   "role"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.text     "image"
    t.boolean  "is_super_admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
