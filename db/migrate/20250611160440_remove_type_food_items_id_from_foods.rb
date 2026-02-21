class RemoveTypeFoodItemsIdFromFoods < ActiveRecord::Migration[8.0]
  def change
    remove_reference :foods, :food_items_id, :integer, index: true, foreign_key: true
  end
end
