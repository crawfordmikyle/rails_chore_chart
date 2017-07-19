class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, through: :friendships, :source => :user
  has_many :tasks
  has_many :chores, through: :tasks

  def user_friendships
    @user_friendships = Friendship.user_friendships(self)
  end

  def confirm_friendship(friendship)
    frindship.accepted = true
    friendship.save
  end

  def confirmed_friend_requests
    @confirmed_friendships = user_friendships.keep_if{|fs| fs.accepted == true }
  end

  def pending_friend_requests
    @pending_friend_requests = user_friendships.keep_if{|fs| fs.accepted == nil}
  end

  def current_team
    teams.first
  end

  def accepted_chore(chore)
    Task.all.find_by(:user_id => id, :chore_id => chore.id)
  end

  def friends_with(friend_id)

  end


end
