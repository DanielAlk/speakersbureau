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

ActiveRecord::Schema.define(version: 20150821120159) do

  create_table "areas", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "areas", ["slug"], name: "index_areas_on_slug", unique: true, using: :btree

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
  end

  add_index "speakers", ["slug"], name: "index_speakers_on_slug", unique: true, using: :btree

  add_foreign_key "speaker_areas", "areas"
  add_foreign_key "speaker_areas", "speakers"
  add_foreign_key "speaker_images", "speakers"
  add_foreign_key "speaker_videos", "speakers"
end
