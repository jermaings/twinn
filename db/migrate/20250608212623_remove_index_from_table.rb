class RemoveIndexFromTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :condiments, :rails, :string
    remove_column :condiments, :generate, :string
    remove_column :condiments, :migration, :string
    remove_column :condiments, :RemoveCondimentFromIndex, :string
    remove_column :condiments, :index, :string
  end
end
