class Chore < ApplicationRecord
  belongs_to :team

  validates :name, presence: true

  def mark_completed
    self.completed = true
    self.save
  end

  def accepted
    if Task.all.find_by(:chore_id => id)
      true
    end
  end

  def task_id
    Task.all.find_by(:chore_id => id).id
  end

end
