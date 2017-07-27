class UserTeamsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    if user_team = UserTeam.find_by_id(params[:id])
      user_team.delete
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Can't Find Request"
      redirect_to user_path(current_user)
    end 
  end

private
  def user_teams_params
    params.require(:user_teams_attributes).permit(:user_id)
  end
end
