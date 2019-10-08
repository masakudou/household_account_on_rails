class StaticPagesController < ApplicationController
  def home
    @categorized_exp_data, @color_data = return_categorized_expenditure_hash_monthly(current_user)
  end

  def help
  end

  def about
  end

  # 今月分のBookRecordsを全て抽出し、カテゴリ別の合計支出と色を返す
  def return_categorized_expenditure_hash_monthly(user)
    @book_records = BookRecord.where(user_id: user.id)
    categorized_exp_hash = {}
    colors = []
    @book_records.each do |record|
      next unless record.direction.zero?

      category = Category.find_by(id: record.category)
      category_name = category.nil? ? "未分類" : category.name
      if categorized_exp_hash[category_name].nil?
        category_amount = 0
        colors << category.color
      else
        category_amount = categorized_exp_hash[category_name]
      end
      categorized_exp_hash.store(category_name, category_amount + record.amount)
    end

    [categorized_exp_hash, colors]
  end
end
