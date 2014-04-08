# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider 'twitter'
    sequence(:uid) { |s| s.to_i }
    sequence(:screen_name) { |s| "user_#{s}" }
  end
end
