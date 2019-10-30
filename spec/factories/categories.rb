FactoryGirl.define do
  factory :category do
    name "sample1"
    color "#FFFFFF"
    user_id 0
  end

  factory :category do
    name "sample2"
    color "#EEEEEE"
    user_id 1
  end

  factory :category do
    name "sample3"
    color "#DDDDDD"
    user_id 1
  end
end
