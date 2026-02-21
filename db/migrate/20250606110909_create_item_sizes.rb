class CreateItemSizes < ActiveRecord::Migration[8.0]
  def change
    create_table :item_sizes do |t|
      t.string :index
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
