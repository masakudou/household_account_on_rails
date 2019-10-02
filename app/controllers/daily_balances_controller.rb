class DailyBalancesController < ApplicationController
  def show
    @user = User.find_by(id: params[:user_id])
    @daily_balance = @user.daily_balances.find_by(id: params[:id])
    @book_records = @user.book_records.where(record_date: @daily_balance.record_date)

    @exp_inc_data = @daily_balance.expenditure_income_hashed
    @categorized_exp_data = return_categorized_expenditure_hash(params[:user_id], @daily_balance.record_date)
  end

  private

  # ユーザーIDと日付からBookRecordモデルのレコードを取り出し、category別に支出額をハッシュ化する
  def return_categorized_expenditure_hash(user_id, record_date)
    @book_records = BookRecord.where(user_id: user_id, record_date: record_date)
    categorized_exp_hash = {}
    @book_records.each do |record|
      next unless record.direction.zero?

      category = Category.find_by(id: record.category)
      category_name = category.nil? ? "Uncategorized" : category.name
      category_amount = categorized_exp_hash[category_name].nil? ? 0 : categorized_exp_hash[category_name]
      categorized_exp_hash.store(category_name, category_amount + record.amount)
    end

    categorized_exp_hash
  end
end
