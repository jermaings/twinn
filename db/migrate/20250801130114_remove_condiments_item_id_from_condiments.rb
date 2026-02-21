class RemoveCondimentsItemIdFromCondiments < ActiveRecord::Migration[8.0]
  def change
    remove_column :condiments, :condiments_item_id, :integer
    add_reference :food_items, :condiments, foreign_key: true
  end
end
