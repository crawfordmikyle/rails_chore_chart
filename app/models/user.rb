class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :user_teams
  has_many :teams, through: :user_teams


  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user



  has_many :tasks
  has_many :chores, through: :tasks

  def accepted_chore(chore)
    Task.all.find_by(:user_id => id, :chore_id => chore.id)
  end

  def accepted_request(request)
    request.status = "Accepted"
    request.save
  end

  def inverse_friendship_lookup(friendship)
    inverse_friendships.find_by(:user_id => friendship.friend_id)
  end

  def confirmed_friends
    @confirmed_friends = []
    friendships.each do |friendship|
      inverse_friendships = inverse_friendship_lookup(friendship)
      if friendship.status == "Accepted" && inverse_friendship.status == "Accepted"
        @confirmed_friends << friendship.friend
      end
    end
    @confirmed_friends
  end

end
