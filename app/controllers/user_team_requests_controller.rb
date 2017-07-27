class UserTeamRequestsController < ApplicationController
  def create
    user = User.find_by_id(params[:request][:user_id])
    if user_team_request = user.user_team_requests.build(user_team_request_params)
      if !user.has_user_team_reqiest?(user_team_request.team)
        user_team_request.status = "Pending"
        user_team_request.save
        flash[:success] = "Request Sent!"
        redirect_to team_path(user_team_request.team)
      else
        flash[:notice] = "That Request Was Already Sent"
        redirect_to team_path(user_team_request.team)
      end
    else
      flash[:alert] = "This is in invalid request"
      redirect_to root_path
    end
  end

  #used to accept the request
  def update
    user_team_request = UserTeamRequest.find_by_id(params[:id])

    user_team_request.delete

    user_team_request.create_user_team
    flash[:success] = "Team Request Accepted!"

    redirect_to user_path(current_user)
  end

  private

  def user_team_request_params
    params.require(:request).permit(:user_id, :team_id)
  end
end
