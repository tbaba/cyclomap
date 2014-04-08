# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    route_lab_id { SecureRandom.hex }

    after(:create) do |course, evaluator|
      if course.user.nil?
        user = FactoryGirl.create(:user)
        course.update_attributes! user_id: user.id
      end
    end
  end
end
