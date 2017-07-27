class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def find_inverse
    Friendship.find_by(:user_id => friend_id, :friend_id => user_id)
  end

  def create_inverse
    Friendship.create(:user_id => friend_id, :friend_id => user_id)
  end
end
