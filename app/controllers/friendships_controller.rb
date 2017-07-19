class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:id])
    @friendship.save
    redirect_to teams_path()
  end

  def destroy

  end
end
