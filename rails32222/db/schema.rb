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

ActiveRecord::Schema.define(:version => 20160512001131) do

  create_table "birds", :force => true do |t|
    t.integer  "tree_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "birds", ["name"], :name => "index_birds_on_name", :unique => true
  add_index "birds", ["tree_id"], :name => "index_birds_on_tree_id"

  create_table "feathers", :force => true do |t|
    t.integer  "bird_id"
    t.string   "color"
    t.integer  "length"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feathers", ["bird_id"], :name => "index_feathers_on_bird_id"

  create_table "trees", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trees", ["name"], :name => "index_trees_on_name", :unique => true

end
