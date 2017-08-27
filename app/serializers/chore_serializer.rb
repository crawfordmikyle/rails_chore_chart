class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :team_id, :completed
end
