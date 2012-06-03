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

ActiveRecord::Schema.define(:version => 20120602235732) do

  create_table "bus_log_stops", :force => true do |t|
    t.integer  "bus_id"
    t.integer  "bus_stop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bus_log_stops", ["bus_id"], :name => "index_bus_log_stops_on_bus_id"
  add_index "bus_log_stops", ["bus_stop_id"], :name => "index_bus_log_stops_on_bus_stop_id"

  create_table "bus_stops", :force => true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bus_stops", ["city_id"], :name => "index_bus_stops_on_city_id"

  create_table "buses", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "company_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buses", ["company_id"], :name => "index_buses_on_company_id"
  add_index "buses", ["route_id"], :name => "index_buses_on_route_id"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["country_id"], :name => "index_cities_on_country_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["city_id"], :name => "index_companies_on_city_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "route_branches", :force => true do |t|
    t.integer  "start_bus_stop_id"
    t.integer  "end_bus_stop_id"
    t.time     "travel_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "route_branches", ["end_bus_stop_id"], :name => "index_route_branches_on_end_bus_stop_id"
  add_index "route_branches", ["start_bus_stop_id"], :name => "index_route_branches_on_start_bus_stop_id"

  create_table "route_details", :force => true do |t|
    t.integer  "position_order"
    t.boolean  "is_going"
    t.integer  "route_id"
    t.integer  "route_branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "route_details", ["route_branch_id"], :name => "index_route_details_on_route_branch_id"
  add_index "route_details", ["route_id"], :name => "index_route_details_on_route_id"

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.integer  "start_bus_stop_id"
    t.integer  "end_bus_stop_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "routes", ["company_id"], :name => "index_routes_on_company_id"
  add_index "routes", ["end_bus_stop_id"], :name => "index_routes_on_end_bus_stop_id"
  add_index "routes", ["start_bus_stop_id"], :name => "index_routes_on_start_bus_stop_id"

  create_table "users", :force => true do |t|
    t.integer  "company_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["company_id"], :name => "index_users_on_company_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
