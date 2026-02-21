class CreateFoodItems < ActiveRecord::Migration[8.0]
  def change
    create_table :food_items do |t|
      t.string :index
      t.string :name
      t.integer :price
      t.string :comments

      t.timestamps
    end
  end
end
