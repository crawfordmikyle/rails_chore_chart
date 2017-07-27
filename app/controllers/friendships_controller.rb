class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    if friendship = Friendship.find_by_id(params[:id])
      user_team.delete
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Can't Find That"
      redirect_to user_path(current_user)
    end
  end
end
