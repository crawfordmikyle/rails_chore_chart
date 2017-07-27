class FriendshipRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    friendship_request = current_user.friendship_requests.build(:friend_id => params[:id])
    friend = User.find_by_id(params[:id])
    if friendship_request.valid? && !current_user.has_friendship_reqiest?(friend)
      inverse_friendship_request = friendship_request.create_inverse
      friendship_request.save
      inverse_friendship_request.save
      flash[:success] = "Request Sent"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Looks like you sent that already"
      redirect_to user_path(current_user)
    end
  end

  #used to accept the request
  def update
    if friendship_request = FriendshipRequest.find_by_id(params[:id])
      inverse_friendship_request = friendship_request.find_inverse

      friendship_request.create_friendship
      flash[:success] = "Friend Added"

      friendship_request.delete
      inverse_friendship_request.delete
      redirect_to user_path(current_user)
    else
      flash[:alert] = "I can't find that!"
      redirect_to user_path(current_user)
    end
  end

end
