class BookRecordsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @book_record = current_user.book_records.build(book_record_params)
    if @book_record.save
      set_daily_balance(@book_record)
      flash[:success] = "新しい収支が記録されました！"
      redirect_to(root_url)
    else
      flash.now[:danger] = "入力に不備があります。"
      render("static_pages/home")
    end
  end

  def destroy

  end

  private

  def book_record_params
    params.require(:book_record).permit(:direction, :category, :amount, :record_date)
  end

  def set_daily_balance(book_record)
    daily_balance = current_user.daily_balances.find_by(record_date: book_record.record_date)
    if daily_balance.nil?
      daily_balance = current_user.daily_balances.build(expenditure: 0, income: 0, record_date: book_record.record_date)
    end
    # 支出
    if book_record.direction.zero?
      daily_balance.expenditure += book_record.amount
    # 収入
    else
      daily_balance.income += book_record.amount
    end
    daily_balance.save
  end
end
