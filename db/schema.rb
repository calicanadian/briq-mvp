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

ActiveRecord::Schema.define(version: 2019_08_14_223800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "briq_records", force: :cascade do |t|
    t.bigint "briq_id"
    t.bigint "record_id"
    t.boolean "is_construction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["briq_id"], name: "index_briq_records_on_briq_id"
    t.index ["record_id"], name: "index_briq_records_on_record_id"
  end

  create_table "briqs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "records", force: :cascade do |t|
    t.string "record_index"
    t.string "date_open"
    t.string "record_status"
    t.string "record_location"
    t.string "record_type"
    t.text "description"
    t.string "planner"
    t.string "record_module"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "briq_records", "briqs"
  add_foreign_key "briq_records", "records"
end
