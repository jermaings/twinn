class CreateFoodTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :food_types do |t|
      t.string :category
      t.string :name
      t.decimal :price
      t.binary :image
      t.string :size
      t.references :foods, null: false, foreign_key: true

      t.timestamps
    end
  end
end
