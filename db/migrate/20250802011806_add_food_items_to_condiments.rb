class AddFoodItemsToCondiments < ActiveRecord::Migration[8.0]
  def change
    add_reference :condiments, :food_items, null: false, foreign_key: true
  end
end
