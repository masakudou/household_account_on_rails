require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { "example_user" }
  let(:email) { "example@example.com" }
  let(:password) { "abcdefgh" }
  let(:password_confirmation) { "abcdefgh" }
  let(:user) { User.new(name: name, email: email, password: password, password_confirmation: password_confirmation) }

  # ユーザーID、Eメールアドレス、パスワードに問題がない場合、Userモデルのインスタンスが有効になる。
  describe "An instance of the user model" do
    subject { user.valid? }

    context "when the correct parameters are entered" do
      it "is valid." do
        is_expected.to be_truthy
      end
    end
  end

  describe "Name validation in the user model" do
    subject { user.valid? }

    context "when name is blank" do
      let(:name) { " " * 10 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when name exceeds 20 characters" do
      let(:name) { "a" * 21 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end
  end

  describe "Email validation in the user model" do
    subject { user.valid? }

    context "when email is blank" do
      let(:email) { " " * 10 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when email exceeds 128 characters" do
      let(:email) { "a" * 117 + "@example.com" }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when email address is already used by other user" do
      before do
        User.create(name: "Example_user_2",
                    email: "example_2@example.com",
                    password: "abcdefgh",
                    password_confirmation: "abcdefgh")
      end
      let(:email) { "example_2@example.com" }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when the email address string does not match the regular expression 'REGEX_FOR_VALID_EMAIL'" do
      context "if not including '@'" do
        let(:email) { "example_example.com" }

        it "does not pass." do
          is_expected.to be_falsey
        end
      end

      context "if including blank" do
        let(:email) { "example @example.com" }

        it "does not pass." do
          is_expected.to be_falsey
        end
      end

      context "if not including period after '@' character" do
        let(:email) { "example@example_com" }

        it "does not pass." do
          is_expected.to be_falsey
        end
      end

      context "if including '?'" do
        let(:email) { "example_?@example.com" }

        it "does not pass." do
          is_expected.to be_falsey
        end
      end

      context "if placing period at last" do
        let(:email) { "example@example.com." }

        it "does not pass." do
          is_expected.to be_falsey
        end
      end
    end
  end

  describe "Password validation in the user model" do
    subject { user.valid? }

    context "when password is less than 7 characters" do
      let(:password) { "a" * 7 }
      let(:password_confirmation) { "a" * 7 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when password is blank" do
      let(:password) { " " * 10 }
      let(:password_confirmation) { " " * 10 }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when password is nil" do
      let(:password) { nil }
      let(:password_confirmation) { nil }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end

    context "when 'password' and 'password_confirmation' do not match" do
      let(:password_confirmation) { "abcdefgi" }

      it "does not pass." do
        is_expected.to be_falsey
      end
    end
  end
end
