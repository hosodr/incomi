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

ActiveRecord::Schema.define(version: 20200923150948) do

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
    t.integer  "channel_id"
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["channel_id"], name: "index_comments_on_channel_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "channel_id"
    t.string   "name"
    t.text     "abstract",     limit: 65535
    t.text     "zoom_url",     limit: 65535
    t.datetime "host_date"
    t.datetime "from_date"
    t.datetime "to_date"
    t.boolean  "is_delete",                  default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "host_user_id"
    t.index ["channel_id"], name: "index_events_on_channel_id", using: :btree
    t.index ["host_user_id"], name: "index_events_on_host_user_id", using: :btree
  end

  create_table "hellos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participations_on_event_id", using: :btree
    t.index ["user_id"], name: "index_participations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "provider",                            default: "email", null: false
    t.string   "uid",                                 default: "",      null: false
    t.text     "tokens",                limit: 65535
    t.string   "encrypted_password",                  default: "",      null: false
    t.boolean  "allow_password_change",               default: false
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "channels", "channels", column: "parent_channel_id"
  add_foreign_key "channels", "comments", column: "parent_comment_id"
  add_foreign_key "comments", "channels"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "channels"
  add_foreign_key "events", "users", column: "host_user_id"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
end
