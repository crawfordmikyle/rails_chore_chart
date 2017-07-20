class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  #used to confirm friendships
  def update
    @friendship = current_user.inverse_friendships.find_by(:user_id => params[:id])
    @friendship.status = "Accepted"
    @friendship.save
    redirect_to user_show_path(current_user.id)
  end

  def destroy

  end
end
