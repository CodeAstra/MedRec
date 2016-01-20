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

ActiveRecord::Schema.define(version: 20160119133138) do

  create_table "consultations", force: :cascade do |t|
    t.integer  "patient_profile_id"
    t.integer  "doctor_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "appointment_date"
    t.string   "comments"
    t.string   "unique_id"
  end

  add_index "consultations", ["doctor_profile_id"], name: "index_consultations_on_doctor_profile_id"
  add_index "consultations", ["patient_profile_id"], name: "index_consultations_on_patient_profile_id"

  create_table "doctor_profiles", force: :cascade do |t|
    t.integer  "age"
    t.string   "qualification"
    t.string   "contact"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "doctor_profiles", ["user_id"], name: "index_doctor_profiles_on_user_id"

  create_table "medical_reports", force: :cascade do |t|
    t.string   "title"
    t.datetime "report_date"
    t.string   "attachment"
    t.integer  "patient_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "medical_reports", ["patient_profile_id"], name: "index_medical_reports_on_patient_profile_id"

  create_table "patient_profiles", force: :cascade do |t|
    t.integer  "age"
    t.integer  "gender"
    t.string   "contact"
    t.integer  "blood_group"
    t.text     "address"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date_of_birth"
    t.string   "unique_id"
  end

  add_index "patient_profiles", ["user_id"], name: "index_patient_profiles_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.integer  "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.integer  "role_id"
    t.boolean  "profile_incomplete",     default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
