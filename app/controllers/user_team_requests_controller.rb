class UserTeamRequestsController < ApplicationController
  def create
    user = User.find_by_id(params[:user_id])
    if user_team_request = user.user_team_requests.build({:user_id => params[:user_id], :team_id => params[:team_id]})
      if !user.has_user_team_reqiest?(user_team_request)
        user_team_request.status = "Pending"
        user_team_request.save
        flash[:success] = "Request Sent!"
        redirect_to team_path(params[:team_id])
      else
        flash[:notice] = "That Request Was Already Sent"
        redirect_to team_path(params[:team_id])
      end
    else
      flash[:alert] = "This is in invalid request"
      redirect_to team_path(params[:team_id])
    end
  end

  #used to accept the request
  def update
    user_team_request = UserTeamRequest.find_by_id(params[:id])
    user_team_request.status = "Accepted"
    user_team_request.save

    user_team_request.create_user_team
  end
end
