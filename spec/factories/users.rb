FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_user_#{n}" }
    sequence(:email) { |n| "testuser-#{n}@example.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
end
