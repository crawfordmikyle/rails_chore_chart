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
    @team = Team.create({:name => team_params[:name]})
    if team_params[:user_teams_attributes]
      team_params[:user_teams_attributes][:user_id].each do |user_id|
        @team.user_teams.create({:user_id => user_id})
      end
    end
      redirect_to teams_path(@team)
  end

  def show
    @users = User.all
    @team = Team.find_by_id(params[:id])
  end

private
  def team_params
    params.require(:team).permit(:name, :user_teams_attributes => {:user_id => []})
  end
end
