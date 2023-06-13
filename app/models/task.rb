class Task < ApplicationRecord
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :mobile_id
  end

  validates :title, presence: true
  validates :content, presence: true
  validates :mobile_id, presence: true
  validates :start_time, presence: true

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mobile
end
