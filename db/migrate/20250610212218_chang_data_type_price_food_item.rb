class ChangDataTypePriceFoodItem < ActiveRecord::Migration[8.0]
  def change
    change_column :food_items, :price, :decimal
  end
end
