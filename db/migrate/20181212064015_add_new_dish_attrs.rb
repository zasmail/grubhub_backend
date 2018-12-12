class AddNewDishAttrs < ActiveRecord::Migration[5.2]
  def up
    change_table :dishes do |t|
      t.change :dish_media_image, :string
      t.change :media_image, :string
    end
  end

  def down
    change_table :dishes do |t|
      t.change :media_image, :json
    end
  end
end
