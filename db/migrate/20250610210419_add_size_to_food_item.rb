class AddSizeToFoodItem < ActiveRecord::Migration[8.0]
  def change
    add_column :food_items, :size, :string
  end
end
