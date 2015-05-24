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

ActiveRecord::Schema.define(version: 20150515211924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "answers", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.uuid     "task_id"
    t.uuid     "user_id"
    t.integer  "choice"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answers", ["task_id", "user_id"], name: "index_answers_on_task_id_and_user_id", unique: true, using: :btree
  add_index "answers", ["task_id"], name: "index_answers_on_task_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "tasks", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "title"
    t.integer  "task_type",  default: 0
    t.text     "choices",                                 array: true
    t.integer  "cost"
    t.string   "address"
    t.integer  "balance",    default: 0
    t.boolean  "active",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image"
  end

  add_index "tasks", ["address"], name: "index_tasks_on_address", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "address"
    t.integer  "balance",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["address"], name: "index_users_on_address", using: :btree

end
