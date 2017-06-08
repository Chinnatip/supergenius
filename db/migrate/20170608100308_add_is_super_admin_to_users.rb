class AddIsSuperAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_super_admin, :boolean
  end
end
