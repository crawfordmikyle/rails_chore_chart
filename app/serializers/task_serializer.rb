class TaskSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :chore_id 
end
