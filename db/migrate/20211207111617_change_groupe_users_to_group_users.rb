class ChangeGroupeUsersToGroupUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :groupe_users, :group_users
  end
end
