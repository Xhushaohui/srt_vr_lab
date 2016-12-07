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

ActiveRecord::Schema.define(version: 20161011183859) do

  create_table "sceneassets", force: :cascade do |t|
    t.string   "assetname"
    t.string   "location"
    t.string   "text"
    t.integer  "vrscene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sceneassets", ["vrscene_id"], name: "index_sceneassets_on_vrscene_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vrapps", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "tag"
    t.integer  "scenecount"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
  end

  create_table "vrscenes", force: :cascade do |t|
    t.string   "scenename"
    t.integer  "orderid"
    t.string   "scenetype"
    t.integer  "vrapp_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "scene_img_file_name"
    t.string   "scene_img_content_type"
    t.integer  "scene_img_file_size"
    t.datetime "scene_img_updated_at"
  end

  add_index "vrscenes", ["vrapp_id"], name: "index_vrscenes_on_vrapp_id"

end
