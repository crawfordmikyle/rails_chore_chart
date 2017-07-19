class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:id])
    @friendshs
    redirect_to teams_path()
  end

  #used to confirm friendships
  def update
    @friendship = Friendship.find_by(params[:id])
    @inverse_friendship = Frindship.inverse_find(@friendship)
    if @inverse_friendship
      @inverse_friendship.status = "Accepted"
      @friendship.save
    end
    redirect_to user_show_path(current_user.id)
  end

  def destroy

  end
end
