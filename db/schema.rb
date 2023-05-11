# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_11_105520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "school_id"
    t.bigint "course_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_batches_on_course_id"
    t.index ["school_id"], name: "index_batches_on_school_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.integer "course_type", default: 0
    t.decimal "fee"
    t.text "description"
    t.bigint "category_id"
    t.bigint "school_id"
    t.text "learn_content"
    t.text "curriculam"
    t.string "duration"
    t.string "hours_per_day"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.datetime "enrollment_date", null: false
    t.bigint "school_id"
    t.bigint "course_id"
    t.bigint "batch_id"
    t.integer "student_id"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["batch_id"], name: "index_enrollments_on_batch_id"
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["school_id"], name: "index_enrollments_on_school_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone_number"
    t.string "office_phone"
    t.string "website"
    t.text "description"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pin_code"
    t.string "delivery_method"
    t.string "facilities"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "user_name", default: ""
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "office_number"
    t.string "dob"
    t.string "gender"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pin_code"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "school_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

end
