class TeamsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = Team.new
    @users = User.all
  end

  def create
    binding.pry
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
  
end

#<!-- {"utf8"=>"✓", "authenticity_token"=>"tPDMtdb4c5o/zbyMJga9pz3yHAaSvNCZXSFUe44HvWtwyiCKS9baX87MC/f3lGKUfCClH5U3FrcBtZwje7Vj6Q==",
#{}"team"=>{"name"=>"Test Team"},
#{}"user_teams"=>["1", "2"],
#{}"commit"=>"Create Team",
#{}"controller"=>"teams",
#{}"action"=>"create"}
#permitted: false> -->
