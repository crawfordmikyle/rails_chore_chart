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

  def confirmed_friends
    @confirmed_friendships = []
    friendships.each do |friendship|
      inverse_friendship = Friendship.inverse_find(friendship)
      if friendship.status == "Accepted" && inverse_friendship.status == "Accepted"
        @confirmed_friendships << friendship.friend
      end
    end
    @confirmed_friendships
  end

end
