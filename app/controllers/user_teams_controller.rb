class UserTeamsController < ApplicationController
  before_action :authenticate_user!
end
