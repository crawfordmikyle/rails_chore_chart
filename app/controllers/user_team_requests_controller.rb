class UserTeamRequestsController < ApplicationController
  def create
    binding.pry
    user = User.find_by_id(params[:request][:user_id])
    if user_team_request = user.user_team_requests.build(user_team_request_params)
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

  private

  def user_team_request_params
    params.require(:request).permit(:user_id, :team_id)
  end
end
