class UserTeamsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    
  end

private
  def user_teams_params
    params.require(:user_teams_attributes).permit(:user_id)
  end
end
