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

ActiveRecord::Schema.define(version: 20160421233444) do

  create_table "collaborations", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collaborations", ["list_id"], name: "index_collaborations_on_list_id"
  add_index "collaborations", ["user_id"], name: "index_collaborations_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "list_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "item_status", default: false
  end

  add_index "items", ["list_id"], name: "index_items_on_list_id"

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.datetime "completion_date"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "list_status",     default: false
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "subtasks", force: :cascade do |t|
    t.string   "name"
    t.boolean  "subtask_status"
    t.integer  "item_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "subtasks", ["item_id"], name: "index_subtasks_on_item_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "user_photo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username"

end
