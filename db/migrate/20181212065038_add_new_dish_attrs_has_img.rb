class AddNewDishAttrsHasImg < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :has_media_image, :boolean
    add_column :dishes, :has_dish_image, :boolean
    add_column :dishes, :best_image, :string
  end
end
