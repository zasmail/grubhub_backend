class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :objectID
      t.string :dish_name
      t.string :dish_category_name
      t.string :dishes, array: true, default: []
      t.json :dish_media_image
      t.float :dish_price
      t.float :dish_score
      t.string :dish_tag_list, array: true, default: []
      t.string :restaurant_name
      t.boolean :pickup
      t.boolean :delivery
      t.json :ratings
      t.json :delivery_fee
      t.json :delivery_minimum
      t.string :cuisines, array: true, default: []
      t.boolean :track_your_grub
      t.json :address
      t.float :price_rating
      t.string :distance_from_location
      t.float :delivery_time_estimate
      t.float :pickup_time_estimate
      t.json :min_delivery_fee
      t.string :restaurant_cdn_image_url
      t.json :media_image
      t.boolean :recommended
      t.float :rank
      t.json :faceted_rating_data
      t.json :additional_media_images
      t.json :available_hours
      t.boolean :go_to
      t.string :uid
      t.string :score
      t.boolean :new_restaurant
      t.string :vendor_location_i
      t.timestamps
    end
  end
end
