class Team < ApplicationRecord
  has_many :userteams
  has_many :users, through: :userteam
  has_many :chores
end
