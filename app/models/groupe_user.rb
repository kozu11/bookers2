class GroupeUser < ApplicationRecord
  belongs_to :user
  belongs_to :groupe
end
