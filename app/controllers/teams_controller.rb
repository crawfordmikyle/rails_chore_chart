class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
    @users = User.all
  end

  def create
    if team = current_user.teams.build(team_params).save
      team = Team.last
      team.link_to_current_user(current_user)
      team.invite_users(params[:user][:user_ids])
      flash[:success] = "Successfully Created Team"
      redirect_to team_path(team)
    else
      flash[:alert] = "Invalid Name"
      redirect_to new_team_path
    end
  end

  def show
    if @team = Team.find_by_id(params[:id])
      @users = User.all
    else
      flash[:alert] = "I can't find that team!"
      redirect_to teams_path
    end
  end

private
  def team_params
    params.require(:team).permit(:name, :user_id => current_user.id)
  end
end
