class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:id])
    @friendship.save
    binding.pry
    redirect_to teams_path()
  end

  def destroy

  end
end
