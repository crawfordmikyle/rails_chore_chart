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
    current_user.teams.create(team_params)
    redirect_to team_path(@team)
  end

  def show
    @users = User.all
    @team = Team.find_by_id(params[:id])
  end

private
  def team_params
    params.require(:team).permit(:name)
  end
end
