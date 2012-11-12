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

ActiveRecord::Schema.define(:version => 20121031035338) do

  create_table "animal_types", :force => true do |t|
    t.string   "species"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "animals", :force => true do |t|
    t.integer  "zoo_id"
    t.string   "name"
    t.string   "gender"
    t.string   "breeding_status"
    t.date     "dob"
    t.string   "ancestry"
    t.text     "comments"
    t.integer  "animal_type_id",  :limit => 255
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "animals", ["ancestry"], :name => "index_animals_on_ancestry"

  create_table "profiles", :force => true do |t|
    t.text     "name"
    t.text     "address"
    t.text     "phone"
    t.text     "email"
    t.text     "dob"
    t.text     "gender"
    t.text     "location"
    t.text     "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_profiles", :force => true do |t|
    t.text     "name"
    t.text     "address"
    t.text     "phone"
    t.text     "email"
    t.text     "dob"
    t.text     "gender"
    t.text     "location"
    t.text     "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "address"
    t.string   "phone"
    t.date     "dob"
    t.string   "gender"
    t.string   "location"
    t.string   "website"
  end

  create_table "zoos", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.integer  "animal_id"
    t.string   "belongs"
    t.date     "ed"
    t.text     "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
