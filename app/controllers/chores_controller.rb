class ChoresController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def new
    @chore = Chore.new
  end

  def create
    if @chore = current_user.current_team.chores.create(chore_params)
      redirect_to chore_path(@chore)
    else
      redirect_to new_chore_path
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
