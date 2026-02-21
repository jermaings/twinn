class RenameMenuToCategory < ActiveRecord::Migration[8.0]
  def change
    rename_column :foods, :menu, :category
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
