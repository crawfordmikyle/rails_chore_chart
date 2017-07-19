class StaticPagesController < ApplicationController
  def index
    if current_user
      redirect_to user_show_path(current_user)
    else
      :index
    end
  end
end
