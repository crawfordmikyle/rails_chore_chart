class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def self.user_friendships(user)
    @user_friendships = []
    all.where(:user_id => user.id).each do |friendship|
      @user_friendships << friendship
    end
    all.where(:friend_id => user.id).each do |friendship|
      @user_friendships << friendship
    end
    @user_friendships
  end
  
end
