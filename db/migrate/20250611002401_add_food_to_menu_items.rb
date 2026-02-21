class AddFoodToMenuItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :food_items, :food, null: false, foreign_key: true
  end
end
