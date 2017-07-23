class ChoresController < ApplicationController
  before_action :authenticate_user!

  def new
      @chore = Chore.new
      @team = Team.find_by_id(params[:team_id].to_i)
      if !current_user.teams.include?(@team)
        flash[:notice] = "You can only create chores for your team"
        redirect_to team_path(@team)
      end
  end

  def create
    if @team = Team.find_by_id(params[:chore][:team_id].to_i)
      if current_user.teams.include?(@team)
        @chore = @team.chores.build(chore_params)
        @chore.save
        flash[:notice] = "Chore Created"
        redirect_to team_path(@team)
      else
        flash[:notice] = "You can only create chores for your team"
        redirect_to team_path(@team)
      end
    else
      flash[:notice] = "You can only create chores for your team"
      redirect_to team_path(@team)
    end
  end

  def show
    @chore = Chore.find_by_id(params[:id])
  end

private

  def chore_params
    params.require(:chore).permit(:name, :value)
  end

end
