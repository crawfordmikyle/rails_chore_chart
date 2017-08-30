class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    params[:task][:user_id] = current_user.id
    task = Task.create(task_params)
    team = task.chore.team
    @chore = Chore.find_by_id(task.chore_id)

    render @chore, :layout => false
  end

  #used to mark chore completed
  def update
    task = Task.find_by_id(params[:id])
    team = task.chore.team
    if task.user_id == current_user.id
      task.add_points_to_user
      task.chore.mark_completed
      @chore = task.chore
      task.delete
      render @chore, :layout => false 
    end
  end

private

  def task_params
    params.require(:task).permit(:chore_id, :user_id)
  end

end
