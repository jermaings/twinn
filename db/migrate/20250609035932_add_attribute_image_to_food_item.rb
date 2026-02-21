class AddAttributeImageToFoodItem < ActiveRecord::Migration[8.0]
  def change
    add_column :food_items, :image, :binary
  end
end
