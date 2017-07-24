class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    binding.pry
    Task.create({:chore_id => params[:id], :user_id => current_user.id})
    redirect_to team_path(current_user.teams.first.id)
  end

  #used to mark chore completed
  def update
    @task = Task.find_by_id(params[:id])
    if @task.user_id == current_user.id
      @task.chore.mark_completed
      @task.delete
      flash[:notice] = "Chore Marked Completed"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "You can't complete a chore you haven't accepted"
      redirect_to user_path(current_user)
    end
  end

end
