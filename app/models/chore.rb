class Chore < ApplicationRecord
  belongs_to :team

  validates :name, presence: true

  def mark_completed
    completed = true
    save
  end

  def accepted
    if Task.all.find_by(:chore_id => id)
      true
    end
  end
  
end
