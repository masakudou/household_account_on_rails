class DailyBalancesController < ApplicationController
  def show
    @daily_balances = current_user.daily_balances.find_by(id: params[:id])
    @book_records = current_user.book_records.where(record_date: @daily_balances.record_date)
  end
end
