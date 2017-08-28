class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    params[:task][:user_id] = current_user.id
    task = Task.create(task_params)
    respond_to do |format|
      format.json { render json: task }
    end 
  end

  #used to mark chore completed
  def update
    @task = Task.find_by_id(params[:id])
    if @task.user_id == current_user.id
      @task.add_points_to_user
      @task.chore.mark_completed
      @task.delete
      respond_to do |format|
        format.json {render json: @task}
      end 
    end
  end

private

  def task_params
    params.require(:task).permit(:chore_id, :user_id)
  end

end
