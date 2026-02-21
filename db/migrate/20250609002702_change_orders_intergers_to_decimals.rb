class ChangeOrdersIntergersToDecimals < ActiveRecord::Migration[8.0]
  def change
    change_column :orders, :price, :decimal
    change_column :orders, :total, :decimal
    change_column :orders, :tax, :decimal
  end
end
