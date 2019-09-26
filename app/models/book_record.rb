class BookRecord < ApplicationRecord
  belongs_to :user
  validates(:user_id, presence: true)
  validates(:type, presence: true)
  validates(:category, presence: true)
  validates(:amount, presence: true)
  validates(:record_date, presence: true)
end
