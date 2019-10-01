class DailyBalancesController < ApplicationController
  def show
    @user = User.find_by(id: params[:user_id])
    @daily_balances = @user.daily_balances.find_by(id: params[:id])
    @book_records = @user.book_records.where(record_date: @daily_balances.record_date)
  end
end
