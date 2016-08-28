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

ActiveRecord::Schema.define(version: 20160828203142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "resume"
    t.string   "cover_letter"
    t.string   "references"
    t.boolean  "move_forward"
    t.string   "status"
    t.integer  "job_criteria_1"
    t.integer  "job_criteria_2"
    t.integer  "job_criteria_3"
    t.integer  "job_criteria_4"
    t.integer  "job_criteria_5"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "logo"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "department_name"
    t.string   "company_name"
    t.integer  "company_id"
    t.integer  "user_department_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "job_title"
    t.string   "department_name"
    t.integer  "salary"
    t.text     "description"
    t.string   "job_criteria_1"
    t.string   "job_criteria_2"
    t.string   "job_criteria_3"
    t.string   "job_criteria_4"
    t.string   "job_criteria_5"
    t.string   "stage"
    t.date     "projected_start_date"
    t.string   "timeline_status"
    t.boolean  "archive_status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "user_departments", force: :cascade do |t|
    t.integer  "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "department_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "department_name"
    t.integer  "department_id"
    t.integer  "company_id"
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
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
