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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140529173844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bullshits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "other_bullshits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_raws", force: true do |t|
    t.string   "route_id"
    t.string   "route_short_name"
    t.string   "route_long_name"
    t.string   "route_desc"
    t.integer  "route_type"
    t.string   "route_color"
    t.string   "route_text_color"
    t.string   "route_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_stops", force: true do |t|
    t.string   "route_id"
    t.integer  "direction_id"
    t.string   "stop_id"
    t.integer  "stop_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.string   "route_id"
    t.string   "route_short_name"
    t.string   "route_long_name"
    t.string   "route_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stop_raws", force: true do |t|
    t.string   "stop_id"
    t.string   "stop_code"
    t.string   "stop_name"
    t.string   "stop_desc"
    t.float    "stop_lat"
    t.float    "stop_lon"
    t.string   "stop_url"
    t.integer  "location_type"
    t.integer  "parent_station"
    t.string   "tpis_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stop_time_raws", force: true do |t|
    t.integer  "trip_id"
    t.string   "arrival_time"
    t.string   "departure_time"
    t.integer  "stop_id"
    t.integer  "stop_sequence"
    t.string   "stop_headsign"
    t.integer  "pickup_type"
    t.integer  "drop_off_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stops", force: true do |t|
    t.integer  "stop_id"
    t.string   "stop_name"
    t.float    "stop_lat"
    t.float    "stop_lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_raws", force: true do |t|
    t.string   "route_id"
    t.string   "service_id"
    t.integer  "trip_id"
    t.string   "trip_headsign"
    t.integer  "direction_id"
    t.integer  "block_id"
    t.string   "shape_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
