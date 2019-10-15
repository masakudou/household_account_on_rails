class AddIndexDailyBalancesRecordDate < ActiveRecord::Migration[5.2]
  def change
    add_index :daily_balances, [:user_id, :record_date], unique: true
  end
end
