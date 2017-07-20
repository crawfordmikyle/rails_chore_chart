class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :user_teams
  has_many :teams, through: :user_teams

  has_many :friendship_requests

  has_many :friendships
  has_many :friends, through: :friendships


  has_many :tasks
  has_many :chores, through: :tasks

  def accepted_chore(chore)
    Task.all.find_by(:user_id => id, :chore_id => chore.id)
  end

end
