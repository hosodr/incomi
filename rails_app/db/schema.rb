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

ActiveRecord::Schema.define(version: 20200917074348) do

  create_table "channels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "abstract",          limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "parent_channel_id"
    t.integer  "parent_comment_id"
    t.index ["parent_channel_id"], name: "index_channels_on_parent_channel_id", using: :btree
    t.index ["parent_comment_id"], name: "index_channels_on_parent_comment_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "channel_id"
    t.string   "name"
    t.text     "abstract",    limit: 65535
    t.text     "zoom_url",    limit: 65535
    t.datetime "date"
    t.datetime "fromdate"
    t.datetime "todate"
    t.boolean  "delete_flag"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["channel_id"], name: "index_events_on_channel_id", using: :btree
  end

  create_table "hellos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "channels", "channels", column: "parent_channel_id"
  add_foreign_key "channels", "comments", column: "parent_comment_id"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "channels"
end
