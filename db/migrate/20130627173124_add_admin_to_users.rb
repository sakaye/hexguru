class AddAdminToUsers < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean, default: false
    remove_column :cards, :type_id
  end

  def down
    remove_column :users, :admin
  end
end
