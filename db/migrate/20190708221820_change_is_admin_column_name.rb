class ChangeIsAdminColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :isAdmin, :is_admin
  end
end
