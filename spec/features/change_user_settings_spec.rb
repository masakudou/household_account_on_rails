require 'rails_helper'

RSpec.feature "ChangeUserSettings", type: :feature do
  background do
    # テストユーザーの作成
    @user = create(:user)
  end

  scenario "Change user name" do
    # ログイン処理
    log_in(@user)
    # 設定をクリック
    click_on "設定"
    # フォームに入力
    fill_in "user_name", with: "rails user"
    # 設定の変更
    click_button "設定の変更"
    # フラッシュメッセージを確認する
    expect(page).to have_content "基本情報を更新しました。"
    # ホーム画面へ移動し、名前が変わっていることを確認する
    visit root_path
    expect(page).to have_content "rails user さんの収支カレンダー"
  end
end
