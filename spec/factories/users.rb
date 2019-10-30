FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_user_#{n}" }
    sequence(:email) { |n| "testuser-#{n}@example.com" }
  end
end
