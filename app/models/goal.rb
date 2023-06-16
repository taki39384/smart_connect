class Goal < ApplicationRecord
  belongs_to :user

  validates :goal_name, presence: true
  validates :goal_number, presence: true
  validates :achievement_number, presence: true
  
end
