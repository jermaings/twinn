class RemoveNameFromFoods < ActiveRecord::Migration[8.0]
  def change
    remove_column :foods, :name, :string
  end
end
