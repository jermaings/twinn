class RenameFoodItemsIdToFoodId < ActiveRecord::Migration[8.0]
  def change
        rename_column :foods, :food_items_id, :food_id
        rename_index :foods, :index_foods_on_food_items_id, :index_foods_on_food_id
  end
end
