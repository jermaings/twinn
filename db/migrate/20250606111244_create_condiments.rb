class CreateCondiments < ActiveRecord::Migration[8.0]
  def change
    create_table :condiments do |t|
      t.string :index
      t.string :name
      t.integer :price
      t.boolean :checked

      t.timestamps
    end
  end
end
