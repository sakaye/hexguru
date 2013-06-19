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

ActiveRecord::Schema.define(:version => 20130616183638) do

  create_table "cards", :force => true do |t|
    t.string   "name"
    t.string   "color"
    t.integer  "cost"
    t.string   "card_type"
    t.string   "rarity"
    t.boolean  "game_type"
    t.string   "trait"
    t.text     "game_text"
    t.text     "lore_text"
    t.string   "restriction"
    t.string   "faction"
    t.string   "image"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "set_number"
    t.integer  "related_equipment"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "cards", ["color"], :name => "index_cards_on_color"
  add_index "cards", ["name"], :name => "index_cards_on_name"
  add_index "cards", ["set_number"], :name => "index_cards_on_set_number"
  add_index "cards", ["trait"], :name => "index_cards_on_trait"

  create_table "users", :force => true do |t|
    t.string   "username",                               :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
