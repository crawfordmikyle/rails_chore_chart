class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    if friendship = Friendship.find_by(:user_id => current_user.id, :friend_id => params[:id])
      inverse_friendship = friendship.find_inverse
      friendship.delete
      inverse_friendship.delete
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Can't Find That"
      redirect_to user_path(current_user)
    end
  end
end
