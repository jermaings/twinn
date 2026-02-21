class AddCondimentsItemIdToCondiments < ActiveRecord::Migration[8.0]
  def change
    add_column :condiments, :condiments_item_id, :integer
  end
end
