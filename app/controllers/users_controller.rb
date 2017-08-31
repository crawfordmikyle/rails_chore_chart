class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @users }
    end 
  end

  def show
    if current_user.id != params[:id].to_i
      redirect_to root_path
    end
  end

end
