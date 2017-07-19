class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def self.inverse_find(request)
    Friendship.all.find_by(:user_id => request.friend_id, :friend_id => request.user_id)
  end

end
