class AddUniqueConstraintToFoodsYourCategory < ActiveRecord::Migration[8.0]
  def change
    remove_column :foods, :category, :string
    add_column :foods, :menu, :string
    add_index :foods, :menu, unique: true

  end
end
