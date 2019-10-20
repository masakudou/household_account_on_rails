class BookRecord < ApplicationRecord
  belongs_to :user
  validates(:user_id, presence: true)
  validates(:direction, presence: true, numericality: { less_than_or_equal_to: 1 })
  validates(:category, presence: true)
  validates(:amount, presence: true, numericality: { greater_than: 0 })
  validates(:record_date, presence: true)
  validates(:comment, length: { maximum: 140 })
end
