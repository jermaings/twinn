class RemoveColumnNameFromTableName < ActiveRecord::Migration[8.0]
  def change
    remove_column :food_items, :rails, :string
    remove_column :food_items, :generate, :string
    remove_column :food_items, :migration, :string
    remove_column :food_items, :RemoveFoodItemFromIndex, :string
    remove_column :food_items, :index, :string
  end
end
