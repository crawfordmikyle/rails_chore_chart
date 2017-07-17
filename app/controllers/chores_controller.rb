class ChoresController < ApplicationController
  before_action :authenticate_user!

  def new
    @chore = Chore.new
  end

  def create
    binding.pry
  end
end
