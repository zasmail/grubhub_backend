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

ActiveRecord::Schema.define(version: 2018_12_12_065038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "objectID"
    t.string "dish_name"
    t.string "dish_category_name"
    t.string "dishes", default: [], array: true
    t.string "dish_media_image"
    t.float "dish_price"
    t.float "dish_score"
    t.string "dish_tag_list", default: [], array: true
    t.string "restaurant_name"
    t.boolean "pickup"
    t.boolean "delivery"
    t.json "ratings"
    t.json "delivery_fee"
    t.json "delivery_minimum"
    t.string "cuisines", default: [], array: true
    t.boolean "track_your_grub"
    t.json "address"
    t.float "price_rating"
    t.string "distance_from_location"
    t.float "delivery_time_estimate"
    t.float "pickup_time_estimate"
    t.json "min_delivery_fee"
    t.string "restaurant_cdn_image_url"
    t.string "media_image"
    t.boolean "recommended"
    t.float "rank"
    t.json "faceted_rating_data"
    t.json "additional_media_images"
    t.json "available_hours"
    t.boolean "go_to"
    t.string "uid"
    t.string "score"
    t.boolean "new_restaurant"
    t.string "vendor_location_i"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_media_image"
    t.boolean "has_dish_image"
    t.string "best_image"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "start_orders", force: :cascade do |t|
    t.boolean "running", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
