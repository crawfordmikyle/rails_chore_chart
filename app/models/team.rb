class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :chores
  accepts_nested_attributes_for :user_teams

  def confirmed_users=
    @confirmed_users = nil
  end

  def confirmed_users
    @confirmed_users
  end
end
