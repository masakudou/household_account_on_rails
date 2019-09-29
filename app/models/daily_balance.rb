class DailyBalance < ApplicationRecord
  belongs_to :user
  validates(:user_id, presence: true)
  validates(:expenditure, presence: true, numericality: { greater_than_or_equal_to: 0 })
  validates(:income, presence: true, numericality: { greater_than_or_equal_to: 0 })
  validates(:record_date, presence: true, uniqueness: true)
end
