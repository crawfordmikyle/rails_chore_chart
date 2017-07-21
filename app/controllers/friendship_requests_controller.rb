class FriendshipRequestsController < ApplicationController
  def create
    @friend = User.find_by_id(params[:id])

    if friendship_request = current_user.friendship_requests.build({friend_id: @friend.id})
      friendship_request.status = "Accepted"
      friendship_request.save
    end

    if friendship_request = @friend.friendship_requests.build({friend_id: current_user.id})
      friendship_request.save
    end

  end

  #used to accept the request
  def update
    binding.pry
    friendship_request = FriendshipRequest.find_by_id(params[:id])
    friendship_request.status = "Accepted"
    friendship_request.save
    redirect_to create_friendship_path
  end
end
