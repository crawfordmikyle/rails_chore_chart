class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_team_requests

  has_many :user_teams
  has_many :teams, through: :user_teams

  has_many :friendship_requests

  has_many :friendships
  has_many :friends, through: :friendships


  has_many :tasks
  has_many :chores, through: :tasks

  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def accepted_chore(chore)
    Task.all.find_by(:user_id => id, :chore_id => chore.id)
  end

  def friendship_requests_to_confirm
    friendship_requests.select{|request| request.status != "Accepted"}
  end

  def friendship_requests_waiting
    friendship_requests.select{|request| request.status != "Accepted" && request.user_id != id}
  end

  def has_friendship?(friend)
    if friends.include?(friend)
      true
    else
      false
    end
  end

  def has_friendship_reqiest?(friend)
    binding.pry
    if friendship_requests.find_by(:friend_id => friend.id)
      true
    else
      false
    end
  end

  def has_user_team?(team)
    if teams.include?(team)
      true
    else
      false
    end
  end

  def has_user_team_reqiest?(team)
    if user_team_requests.find_by(:team_id => team.id)
      true
    else
      false
    end
  end

end
