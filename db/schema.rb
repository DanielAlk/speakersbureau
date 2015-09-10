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

ActiveRecord::Schema.define(version: 20150909200848) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",        null: false
    t.string   "encrypted_password",     limit: 255, default: "",        null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile",                limit: 255, default: "regular"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "areas", ["slug"], name: "index_areas_on_slug", unique: true, using: :btree
  add_index "areas", ["title"], name: "index_areas_on_title", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "profession",          limit: 255
    t.string   "organization",        limit: 255
    t.string   "city",                limit: 255
    t.string   "zip_code",            limit: 255
    t.string   "email",               limit: 255
    t.string   "phone_number",        limit: 255
    t.string   "request_details",     limit: 255
    t.text     "event_details",       limit: 65535
    t.string   "past_events_speaker", limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.string   "video",      limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "speaker_areas", force: :cascade do |t|
    t.integer  "speaker_id", limit: 4
    t.integer  "area_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "speaker_areas", ["area_id"], name: "index_speaker_areas_on_area_id", using: :btree
  add_index "speaker_areas", ["speaker_id"], name: "index_speaker_areas_on_speaker_id", using: :btree

  create_table "speaker_images", force: :cascade do |t|
    t.integer  "speaker_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "speaker_images", ["speaker_id"], name: "index_speaker_images_on_speaker_id", using: :btree

  create_table "speaker_videos", force: :cascade do |t|
    t.integer  "speaker_id", limit: 4
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "title",      limit: 255
  end

  add_index "speaker_videos", ["speaker_id"], name: "index_speaker_videos_on_speaker_id", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "last_name",           limit: 255
    t.string   "email",               limit: 255
    t.string   "description",         limit: 255
    t.text     "information",         limit: 65535
    t.string   "twitter",             limit: 255
    t.string   "slug",                limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.boolean  "visible_on_home",     limit: 1
  end

  add_index "speakers", ["slug"], name: "index_speakers_on_slug", unique: true, using: :btree

  add_foreign_key "speaker_areas", "areas"
  add_foreign_key "speaker_areas", "speakers"
  add_foreign_key "speaker_images", "speakers"
  add_foreign_key "speaker_videos", "speakers"
end
