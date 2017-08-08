class Task < ApplicationRecord
  belongs_to :user
  belongs_to :chore

  def add_points_to_user
  	self.user.points += self.chore.value
  end 
  
end
