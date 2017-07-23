class FriendshipRequestsController < ApplicationController
  def create
    @friend = User.find_by_id(params[:id])
    @friendship_request = friendship_request = current_user.friendship_requests.build({friend_id: @friend.id})
    @inverse_friendship_request = friendship_request = @friend.friendship_requests.build({friend_id: current_user.id})

    if @friendship_request.new_request? && @@inverse_friendship_request.new_request?
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
    friendship_request = FriendshipRequest.find_by_id(params[:id])
    friendship_request.status = "Accepted"
    friendship_request.save

    friendship_request.create_friendship
  end
end
