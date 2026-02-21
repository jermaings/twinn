class ChangeColumnNameFoodsIdToFoodId < ActiveRecord::Migration[8.0]
  def change
        rename_column :food_types, :foods_id, :food_id
        rename_index :food_types, :index_food_types_on_foods_id, :index_food_types_on_food_id
  end
end
