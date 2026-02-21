class CreateCondimentAmts < ActiveRecord::Migration[8.0]
  def change
    create_table :condiment_amts do |t|
      t.string :index
      t.boolean :small
      t.boolean :medium
      t.boolean :large

      t.timestamps
    end
  end
end
