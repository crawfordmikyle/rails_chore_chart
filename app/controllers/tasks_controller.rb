class TasksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def create
    Task.create({:chore_id => params[:id], :user_id => current_user.id})
    redirect_to team_path(current_user.teams.first.id)
  end

  #used to mark chore completed
  def update
    @task = Task.find_by_id(params[:id])
    @task.chore.mark_completed
    @task.delete
    redirect_to team_path(current_user.teams.first.id)
  end

end
