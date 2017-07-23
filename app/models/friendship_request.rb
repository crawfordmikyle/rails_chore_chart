class FriendshipRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def create_friendship
    user = User.find_by_id(user_id)
    friend = User.find_by_id(friend_id)

    if friendship = user.friendships.build({:user_id => user_id, :friend_id => friend_id})
      friendship.save
    end

    if friendship = friend.friendships.build({:user_id => friend_id, :friend_id => user_id})
      friendship.save
    end
  end

end
