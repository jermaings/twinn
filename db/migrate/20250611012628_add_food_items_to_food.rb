class AddFoodItemsToFood < ActiveRecord::Migration[8.0]
  def change
    add_reference :foods, :food_items, foreign_key: true
  end
end
