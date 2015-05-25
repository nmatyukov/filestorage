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

ActiveRecord::Schema.define(version: 20150522124252) do

  create_table "documents", force: :cascade do |t|
    t.string  "title"
    t.string  "files"
    t.integer "user_id"
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id", unique: true

  create_table "references", force: :cascade do |t|
    t.integer "document_id"
    t.integer "tag_id"
  end

  add_index "references", ["document_id"], name: "index_references_on_document_id", unique: true
  add_index "references", ["tag_id"], name: "index_references_on_tag_id", unique: true

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
