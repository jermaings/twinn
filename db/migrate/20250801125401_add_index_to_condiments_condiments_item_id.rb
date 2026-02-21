class AddIndexToCondimentsCondimentsItemId < ActiveRecord::Migration[8.0]
  def change
        add_reference :food_items, :condiments, null: false, foreign_key: true
  end
end
