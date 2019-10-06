require 'rails_helper'

RSpec.describe BookRecord, type: :model do
  # test user
  let(:name) { "example_user" }
  let(:email) { "example@example.com" }
  let(:password) { "abcdefgh" }
  let(:password_confirmation) { "abcdefgh" }
  let(:user) { User.create(name: name, email: email, password: password, password_confirmation: password_confirmation) }

  # test record
  let(:direction) { 0 }
  let(:category) { 0 }
  let(:amount) { 1000 }
  let(:record_date) { Time.zone.local(2019, 1, 1) }
  let(:book_record) do
    user.book_records.build(direction: direction,
                            category: category,
                            amount: amount,
                            record_date: record_date)
  end

  # 各パラメータに問題がなければ、BookRecordモデルのインスタンスが有効になる。
  describe "An instance of the BookRecord model" do
    subject { book_record.valid? }

    context "when the correct parameters are entered" do
      it "is valid." do
        is_expected.to be_truthy
      end
    end
  end
end
