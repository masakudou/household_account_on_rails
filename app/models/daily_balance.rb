class DailyBalance < ApplicationRecord
  belongs_to :user
  validates(:user_id, presence: true)
  validates(:expenditure, presence: true, numericality: { greater_than_or_equal_to: 0 })
  validates(:income, presence: true, numericality: { greater_than_or_equal_to: 0 })
  validates(:record_date, presence: true, uniqueness: true)

  def expenditure_income_hashed
    { "収入" => income, "支出" => expenditure }
  end
end
