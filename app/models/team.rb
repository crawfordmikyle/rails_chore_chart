class Team < ApplicationRecord
  has_many :user_team_requests

  has_many :user_teams
  has_many :users, through: :user_teams

  has_many :chores

  validates :name, presence: true
  validates :name, uniqueness: true

  def link_to_current_user(user)
      user.user_teams.build({:team_id => self.id, :status => "Accepted"}).save
  end
  
  def invite_users(user_ids)
  	user_ids.each do |user_id|
  		if !user_id.empty?
  			user = User.find_by_id(user_id)
  			user.user_team_requests.build({:team_id => self.id, :status => "Pending"}).save
  		end 
  	end 
  end 
  
end
