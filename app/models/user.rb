class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :tasks
  has_many :chores, through: :tasks

  def default_role
    self.roll = "user"
  end

  def has_role?(role)

  end

  def confirmed_friends
    @confirmed_friends = []
    friendships.all.where(:accepted => true ).each do |friendship|
      @confirmed_friends << friendship.friend
    end
    @confirmed_friends
  end

  def current_team
    teams.first
  end

  def accepted_chore(chore)
    Task.all.find_by(:user_id => id, :chore_id => chore.id)
  end

  def friends_with(friend_id)
    if friendships.find_by({:user_id => id, :friend_id => friend_id})
      true
    end
  end

end
