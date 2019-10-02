class DailyBalancesController < ApplicationController
  def show
    @user = User.find_by(id: params[:user_id])
    @daily_balance = @user.daily_balances.find_by(id: params[:id])
    @book_records = @user.book_records.where(record_date: @daily_balance.record_date)

    @exp_inc_data = @daily_balance.expenditure_income_hashed
    @categorized_exp_data, @color_data = return_categorized_expenditure_hash(params[:user_id], @daily_balance.record_date)
  end

  private

  # ユーザーIDと日付からBookRecordモデルのレコードを取り出し、category別に支出額をハッシュ化する。また、グラフ描画に使う色情報も返す
  def return_categorized_expenditure_hash(user_id, record_date)
    @book_records = BookRecord.where(user_id: user_id, record_date: record_date)
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
