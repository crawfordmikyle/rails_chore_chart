class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :points, :teams
  def teams
  	object.teams.map do |team|
  		TeamSerializer.new(team, scope: scope, root: false, event: object)
  	end 
  end
end
