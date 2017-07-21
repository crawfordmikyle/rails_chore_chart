class UserTeamsRequestsController < ApplicationController
  def create
    @team = Team.find_by_id(params[:id])

    if user_teams_request = current_user.user_teams_requests.build({friend_id: @friend.id})
      user_teams_request.status = "Accepted"
      user_teams_request.save
    end

    if user_teams_request = @friend.user_teams_requests.build({friend_id: current_user.id})
      user_teams_request.save
    end

  end

  #used to accept the request
  def update
    user_teams_request = UserTeamsRequest.find_by_id(params[:id])
    user_teams_request.status = "Accepted"
    user_teams_request.save

    user_teams_request.create_user_teams
  end
end
