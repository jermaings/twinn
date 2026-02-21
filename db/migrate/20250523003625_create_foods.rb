class CreateFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :category
      t.binary :image

      t.timestamps
    end
  end
end
