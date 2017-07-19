class UserTeamsController < ApplicationController
  before_action :authenticate_user!
  
private
  def user_teams_params
    params.require(:user_teams_attributes).permit(:user_id)
  end
end
