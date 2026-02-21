class RemoveColumnItemSizeFromIndex < ActiveRecord::Migration[8.0]
  def change
    remove_column :item_sizes, :index, :string
    remove_column :condiment_amts, :index, :string
    remove_column :orders, :index, :string
  end
end
