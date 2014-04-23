# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    route_lab_id { SecureRandom.hex }

    ignore do
      course_type nil
    end

    before(:create) do |course, evaluator|
      if course.user.nil?
        user = FactoryGirl.create(:user)
        course.user_id = user.id
      end

      course.tag_list = evaluator.course_type
    end

    factory :hillclimb do
      course_type 'ヒルクライム'
    end

    factory :cycling do
      course_type 'サイクリング'
    end
  end
end
