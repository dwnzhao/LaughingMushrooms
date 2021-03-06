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

ActiveRecord::Schema.define(:version => 20130216071234) do

  create_table "comments", :force => true do |t|
    t.integer  "author_id"
    t.integer  "post_id"
    t.text     "content"
    t.string   "author_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "creator_id"
    t.string   "header"
    t.string   "body"
    t.string   "url"
    t.boolean  "archived",   :default => false, :null => false
    t.boolean  "liked",      :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "posts_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "post_id"
  end

  add_index "posts_users", ["user_id", "post_id"], :name => "index_posts_users_on_user_id_and_post_id"

  create_table "users", :force => true do |t|
    t.string   "first_name",          :limit => 25
    t.string   "last_name",           :limit => 50
    t.string   "email",                             :default => "",    :null => false
    t.boolean  "email_confirmed",                   :default => false
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "user_level",                        :default => 1
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

end
