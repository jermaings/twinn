class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :index
      t.string :name
      t.integer :price
      t.integer :tax
      t.integer :total
      t.integer :orderNumber

      t.timestamps
    end
  end
end
