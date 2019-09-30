class DailyBalancesController < ApplicationController
  def show
    @daily_balances = current_user.daily_balances.find_by(record_date: params[:record_date])
  end
end
