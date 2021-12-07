class Group < ApplicationRecord
  has_many :groupe_users
  has_many :users, through: :group_users
  
  validates :name, presence: true
  validates :introduction, presence: true
  
  attachment :image
end
