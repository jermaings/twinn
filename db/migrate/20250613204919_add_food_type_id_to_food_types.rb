class AddFoodTypeIdToFoodTypes < ActiveRecord::Migration[8.0]
  def change
    add_column :food_types, :food_types_id, :string
  end
end
