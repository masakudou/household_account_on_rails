require 'rails_helper'

RSpec.describe BookRecord, type: :model do
  # test category
  let(:category_name) { "sample" }
  let(:category_color) { "#FFFFFF" }
  let(:category_user_id) { 0 }
  let(:category_instance) { Category.create(name: category_name, color: category_color, user_id: category_user_id) }

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
  let(:comment) { "a" * 140 }
  let(:book_record) do
    user.book_records.build(direction: direction,
                            category: category,
                            amount: amount,
                            record_date: record_date,
                            comment: comment)
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

  # 各カラムのバリデーションチェック
  describe "Direction validation in the BookRecord model" do
    subject { book_record.valid? }

    context "when direction is nil" do
      let(:direction) { nil }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when a value of 2 or more is specified for direction" do
      let(:direction) { 2 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end
  end

  describe "Category validation in the BookRecord model" do
    subject { book_record.valid? }

    context "when category is nil" do
      let(:category) { nil }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end
  end

  describe "Amount validation in the BookRecord model" do
    subject { book_record.valid? }

    context "when amount is nil" do
      let(:amount) { nil }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when amount is zero" do
      let(:amount) { 0 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when amount is negative" do
      let(:amount) { -1 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end
  end

  describe "RecordDate validation in the BookRecord model" do
    subject { book_record.valid? }

    context "when record_date is nil" do
      let(:record_date) { nil }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end
  end

  describe "Comment validation in the BookRecord model" do
    subject { book_record.valid? }

    context "when comment is nil" do
      let(:comment) { nil }

      it "does pass." do
        is_expected.to be_truthy
      end
    end

    context "when comment is blank" do
      let(:comment) { " " * 10 }

      it "does pass." do
        is_expected.to be_truthy
      end
    end

    context "when comment length is 141" do
      let(:comment) { "a" * 141 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end
  end

  # クラスメソッド
  describe "Category name from category ID of instance" do
    subject { book_record.category_name }

    context "when executed 'category_name' method of BookRecord model" do
      let(:category) { 1 }

      it "has correctly got." do
        is_expected.to eq "sample"
      end
    end
  end
end
