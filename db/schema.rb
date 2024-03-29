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

ActiveRecord::Schema.define(:version => 20120210053740) do

  create_table "approvals", :force => true do |t|
    t.string   "approvable_type",                  :null => false
    t.string   "approvable_id",   :default => "0"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_profiles", :force => true do |t|
    t.integer  "client_id",      :null => false
    t.string   "name"
    t.integer  "province_id"
    t.integer  "regency_id"
    t.integer  "subdistrict_id"
    t.integer  "village_id"
    t.integer  "commune_id"
    t.integer  "neighborhood"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "username",               :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_creator_id",                     :null => false
    t.string   "document_code"
  end

  add_index "clients", ["email"], :name => "index_clients_on_email", :unique => true
  add_index "clients", ["reset_password_token"], :name => "index_clients_on_reset_password_token", :unique => true

  create_table "communes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_clearances", :force => true do |t|
    t.integer  "loan_id"
    t.boolean  "is_cleared", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.decimal  "amount",      :precision => 15, :scale => 2
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_paid",  :precision => 15, :scale => 2, :default => 0.0
  end

  create_table "offices", :force => true do |t|
    t.string   "name",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "island_id"
    t.integer  "province_id"
    t.integer  "regency_id"
    t.integer  "subdistrict_id"
  end

  create_table "payments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",           :precision => 15, :scale => 2
    t.integer  "loan_id",                                         :null => false
    t.integer  "user_id",                                         :null => false
    t.text     "transaction_code"
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regencies", :force => true do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subdistricts", :force => true do |t|
    t.string   "name"
    t.integer  "regency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username",               :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "office_id",                              :null => false
    t.string   "employee_code"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "villages", :force => true do |t|
    t.string   "name"
    t.integer  "subdistrict_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "postal_code"
  end

end
