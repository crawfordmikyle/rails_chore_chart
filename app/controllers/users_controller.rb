class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if current_user.id != params[:id].to_i
      redirect_to root_path
    end
  end

end
