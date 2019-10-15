class BookRecord < ApplicationRecord
  belongs_to :user
  validates(:user_id, presence: true)
  validates(:direction, presence: true)
  validates(:category, presence: true)
  validates(:amount, presence: true)
  validates(:record_date, presence: true)
  validates(:comment, length: { maximum: 140 })
end
