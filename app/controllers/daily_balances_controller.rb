class DailyBalancesController < ApplicationController
  def show
    @daily_balance = DailyBalance.find_by(user_id: params[:user_id], record_date: params[:record_date])
  end
end
