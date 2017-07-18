class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    Task.create({:chore_id => params[:id], :user_id => current_user.id})
    redirect_to user_show_path(current_user)
  end

end
