module DailyBalancesHelper
  def get_category_name(category_id)
    category = Category.find_by(id: category_id)
    category.nil? ? "Uncategorized" : category.name
  end

  def get_category_color(category_id)
    category = Category.find_by(id: category_id)
    category.nil? ? "#BBBBBB" : category.color
  end
end
