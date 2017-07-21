class Team < ApplicationRecord
  has_many :user_team_requests

  has_many :user_teams
  has_many :users, through: :user_teams

  has_many :chores
  accepts_nested_attributes_for :user_teams

  validates :name, presence: true

  def confirmed_users=
    @confirmed_users = nil
  end

  def confirmed_users
    @confirmed_users
  end
end
