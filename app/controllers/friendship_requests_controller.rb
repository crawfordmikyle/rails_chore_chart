class FriendshipRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friend = User.find_by_id(params[:id])
    @friendship_request = friendship_request = current_user.friendship_requests.build({friend_id: @friend.id})
    @inverse_friendship_request = friendship_request = @friend.friendship_requests.build({friend_id: current_user.id})

    if !current_user.has_friendship_reqiest?(@friend) && !@friend.has_friendship_reqiest?(current_user)
      @friendship_request.status = "Accepted"
      @friendship_request.save
      @inverse_friendship_request.save
      flash[:success] = "Request Sent"
      redirect_to user_path(current_user)
    else
      flash[:success] = "Looks like one of you sent that already :)"
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
