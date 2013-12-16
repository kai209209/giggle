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

ActiveRecord::Schema.define(version: 20131216071823) do

  create_table "evaluates", force: true do |t|
    t.string   "title"
    t.text     "details"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "messageable_type"
    t.integer  "messageable_id"
  end

  add_index "messages", ["created_at"], name: "index_messages_on_product_id_and_created_at", using: :btree

  create_table "product_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_categories", ["name"], name: "index_product_categories_on_name", unique: true, using: :btree

  create_table "product_pictures", force: true do |t|
    t.string   "picture"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_pictures", ["product_id"], name: "index_product_pictures_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "details"
    t.decimal  "price",               precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_category_id"
    t.integer  "cover_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
