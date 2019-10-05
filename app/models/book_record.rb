class BookRecord < ApplicationRecord
  belongs_to :user
  validates(:user_id, presence: true)
  validates(:direction, presence: true)
  validates(:category, presence: true)
  validates(:amount, presence: true)
  validates(:record_date, presence: true)
  validate(:avoid_nonexistent_dates)

  def avoid_nonexistent_dates
    date_before_correction = record_date_before_type_cast
    max_day_number = 31 if date_before_correction[2].in?([1, 3, 5, 5, 8, 10, 12])
    max_day_number = 30 if date_before_correction[2].in?([4, 6, 9, 11])
    if date_before_correction[2] == 2
      # 閏年
      year = date_before_correction[1].to_i
      if ((year % 4).zero? && (year % 100).nonzero?) || (year % 400).zero?
        max_day_number = 29
      else
        max_day_number = 28
      end
    end

    errors.add(:invalid_date, ": 存在しない日付です。") if date_before_correction[3] > max_day_number
  end
end
