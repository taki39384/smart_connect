class Tag < ApplicationRecord
  has_many :task_tag_relations, dependent: :destroy
  has_many :tasks, through: :task_tag_relations, dependent: :destroy
end
