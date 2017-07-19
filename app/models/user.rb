class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :inverse_user_teams, :class => "user_teams", :foreign_key => "team_id"
  has_many :inverse_teams, through: :user_teams, :source => :user
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, through: :friendships, :source => :user
  has_many :tasks
  has_many :chores, through: :tasks

  def accepted_chore(chore)
    Task.all.find_by(:user_id => id, :chore_id => chore.id)
  end

end
