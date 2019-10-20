module BookRecordHelper
  # userが持つdate(月)の収支データを全て読み出し、pie_chartのパラメーター配列として返す
  def monthly_expenditure_by_category(user, date)
    book_records = BookRecord.where(user_id: user.id, record_date: date.in_time_zone.all_month)
    parameters = initialize_parameter_array()
    book_records.each do |record|
      # 収入のレコードは参照しない
      next unless record.direction.zero?

      category = Category.find_by(id: record.category)
      category_name = category.nil? ? "未分類" : category.name
      parameters.each do |parameter|
        # 対象のレコードと同じカテゴリをパラメーター配列から探し、支出額を加算
        if parameter[0] == category_name
          parameter[1] += record.amount
          break
        end
      end
    end

    parameters = delete_if_amount_is_zero(parameters)
    parameters, colors = separate_color_column(parameters)

    return [parameters, colors: colors, messages: { empty: "データがありません。" }]
  end

  private

  # Categoryモデルのレコード分+未定義分のパラメーター配列を初期化する。
  def initialize_parameter_array
    all_category = Category.all
    parameter_array = []
    all_category.each do |category|
      parameter_array.push([category.name, 0, category.color])
    end

    parameter_array.push(["未分類", 0, "#BBBBBB"])
  end

  # parameterの第3引数(色コード)を別の配列に分離する
  def separate_color_column(parameters)
    colors = []
    parameters.each do |parameter|
      colors.push(parameter[2])
      parameter.delete_at(-1)
    end

    return parameters, colors
  end

  # 支出額が0であるカテゴリのパラメーターは削除する
  def delete_if_amount_is_zero(parameters)
    parameters.delete_if do |parameter|
      parameter[1].zero?
    end
  end
end
