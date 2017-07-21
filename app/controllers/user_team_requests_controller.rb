class UserTeamRequestsController < ApplicationController
  def create
    if user_team_request = current_user.user_team_requests.build({:user_id => params[:user_id], :team_id => params[:team_id]})
      user_team_request.status = "Pending"
      user_team_request.save
    end
      redirect_to team_path(params[:team_id])
  end

  #used to accept the request
  def update
    user_team_request = UserTeamRequest.find_by_id(params[:id])
    user_team_request.status = "Accepted"
    user_team_request.save

    user_team_request.create_user_team
  end
end
