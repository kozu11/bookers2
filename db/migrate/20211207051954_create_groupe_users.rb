class CreateGroupeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :groupe_users do |t|
      t.references :user, foreign_key: true
      t.references :groupe, foreign_key: true

      t.timestamps
    end
  end
end
