class FriendshipRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def create_friendship
    binding.pry
    current_user.friendships.build
  end
end
