# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080509164356) do

  create_table "entries", :force => true do |t|
    t.string   "permalink"
    t.string   "title"
    t.text     "excerpt"
    t.text     "body"
    t.string   "state",        :default => "passive"
    t.datetime "published_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "preferences", :force => true do |t|
    t.integer "preferrer_id",                                  :null => false
    t.string  "preferrer_type", :limit => 128, :default => "", :null => false
    t.integer "preferred_id"
    t.string  "preferred_type",                :default => "", :null => false
    t.string  "name",           :limit => 128, :default => "", :null => false
    t.text    "value"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "state",                                   :default => "passive"
    t.datetime "deleted_at"
  end

end
