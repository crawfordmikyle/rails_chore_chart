class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    params[:task][:user_id] = current_user.id
    task = Task.create(task_params)
    team = task.chore.team
    respond_to do |format|
      format.html {redirect_to(team_path(team))}
      format.json {render json: team}
    end
  end

  #used to mark chore completed
  def update
    task = Task.find_by_id(params[:id])
    team = task.chore.team
    if task.user_id == current_user.id
      task.add_points_to_user
      task.chore.mark_completed
      task.delete
    end
    respond_to do |format|
      format.html {redirect_to(team_path(team))}
      format.json {render json: team}
    end
  end

private

  def task_params
    params.require(:task).permit(:chore_id, :user_id)
  end

end
