class AddIndexFoodCategory < ActiveRecord::Migration[8.0]
  def change
    rename_column :foods, :menu, :category
  end
end
