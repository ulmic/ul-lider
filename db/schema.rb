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

ActiveRecord::Schema.define(version: 20151125140943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "club_participants", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "patronymic"
    t.text     "phone"
    t.text     "email"
    t.text     "past_participation"
    t.datetime "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_participants", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_social_participants", force: :cascade do |t|
    t.text     "provider"
    t.text     "uid"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "photo"
    t.text     "profile"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.text     "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "goal"
    t.text     "participant_count"
    t.text     "results"
    t.text     "type"
    t.text     "file"
    t.text     "photo"
    t.text     "video"
    t.text     "pluses"
    t.text     "minuses"
    t.text     "most_liked"
    t.text     "can_change"
    t.text     "work_with_command"
    t.text     "resources"
    t.text     "jury"
    t.text     "tasks"
    t.integer  "result_participant_count"
  end

  create_table "news", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "photo"
  end

  create_table "pages", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "view"
  end

  create_table "promocodes", force: :cascade do |t|
    t.text     "code"
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "birth_date"
    t.string   "confirmation_token"
    t.string   "reset_password_token"
    t.string   "state",                default: "waiting_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "municipality"
    t.text     "patronymic"
    t.text     "school"
    t.text     "group"
    t.text     "home_phone"
    t.text     "mobile_phone"
    t.text     "locality"
    t.text     "postcode"
    t.text     "role"
    t.string   "creative_work"
    t.text     "url_creative_work"
    t.text     "life_goals"
    t.text     "fair_goals"
    t.text     "region",               default: "Ульяновская область"
    t.string   "average"
    t.integer  "reserve_order_number"
    t.integer  "contest_year"
  end

end
