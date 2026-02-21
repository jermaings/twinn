class AddCategoryToFoodItem < ActiveRecord::Migration[8.0]
  def change
    add_column :food_items, :category, :string
  end
end
