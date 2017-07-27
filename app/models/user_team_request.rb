class UserTeamRequest < ApplicationRecord
  belongs_to :user
  belongs_to :team

  def create_user_team
    user = User.find_by_id(user_id)
    team = Team.find_by_id(team_id)

    if user_team = user.user_teams.build({:user_id => user_id, :team_id => team_id})
      user_team.save
    end
  end

end
