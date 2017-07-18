class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    Task.create({:chore_id => params[:id], :user_id => current_user.id})
    redirect_to user_show_path(current_user)
  end

  def edit
    @task = Task.find_by_id(params.id)
  end

  def update
    @task = Task.find_by_id(params.id)
    binding.pry
  end
end
