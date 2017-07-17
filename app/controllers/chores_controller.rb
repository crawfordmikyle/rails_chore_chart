class ChoresController < ApplicationController
  before_action :authenticate_user!

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

private

  def chore_params
    params.require(:chore).permit(:name, :value)
  end

end
