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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131124014535) do

  create_table "conversations", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "nsfw"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "inverse_id"
  end

  add_index "conversations", ["sender_id"], :name => "index_conversations_on_sender_id", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "phone",                                :null => false
    t.string   "gender"
    t.integer  "zip_code"
    t.date     "birthday"
    t.boolean  "nsfw",              :default => false
    t.boolean  "looking_for_pairs", :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "session_token"
  end

  add_index "users", ["phone"], :name => "index_users_on_phone", :unique => true

end
