module DailyBalancesHelper
  # 該当するIDのカテゴリがない場合は未分類として返す
  def get_category_name(category_id)
    category = Category.find_by(id: category_id)
    category.nil? ? "未分類" : category.name
  end

  def get_category_color(category_id)
    category = Category.find_by(id: category_id)
    category.nil? ? "#BBBBBB" : category.color
  end

  # 支出と収入が共に0であれば真
  def empty_daily_balance?(daily_balance)
    return true if daily_balance.expenditure.zero? && daily_balance.income.zero?
  end
end
