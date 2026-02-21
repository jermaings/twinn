class ChangeItemSizePriceToDecimal < ActiveRecord::Migration[8.0]
  def change
    change_column :item_sizes, :price, :decimal
    end
  end
end
