class Task < ApplicationRecord
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :mobile_id
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mobile
end
