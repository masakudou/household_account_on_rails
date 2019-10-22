class DailyBalancesController < ApplicationController
  def show
    @daily_balance = DailyBalance.find_by(id: params[:id])
  end
end
