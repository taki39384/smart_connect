class Task < ApplicationRecord
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :mobile_id
  end

  validates :title, presence: true
  validates :content, presence: true
  validates :mobile_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :task_tag_relations, dependent: :destroy
  has_many :tags, through: :task_tag_relations, dependent: :destroy

  def self.search(search)
    if search != ""
      Task.where('title LIKE(?)', "%#{search}%")
    else
      Task.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mobile
end
