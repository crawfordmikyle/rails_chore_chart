class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:id])
    binding.pry
  end
end
