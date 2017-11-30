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

ActiveRecord::Schema.define(version: 20171130170649) do

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "comment_id"
    t.integer  "frequency_id"
    t.integer  "site_id"
    t.integer  "task_id"
    t.string   "counter"
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_date"
    t.datetime "updated_date"
    t.string   "upload_id"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "title"
    t.integer  "order_id"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
