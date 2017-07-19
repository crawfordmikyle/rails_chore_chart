class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:id])
    @friendshs
    redirect_to teams_path()
  end

  #used to confirm friendships
  def update
    binding.pry
    @friendship = current_user.friendships.find_by_id(params[:id])
    @friendship.status = "Accepted"
    @friendship.save
    redirect_to user_show_path(current_user.id)
  end

  def destroy

  end
end
