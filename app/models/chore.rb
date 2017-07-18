class Chore < ApplicationRecord
  belongs_to :team

  validates :name, presence: true

  def mark_completed
    completed = true
    save
  end
end
