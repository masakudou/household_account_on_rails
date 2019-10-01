module DailyBalancesHelper
  def get_category_name(category_id)
    category = Category.find_by(id: category_id)
    category.nil? ? "Uncategorized" : category.category_name
  end
end
