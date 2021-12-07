class RenameGroupeIdColumnToGroupeUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :groupe_users, :groupe_id, :group_id
  end
end
