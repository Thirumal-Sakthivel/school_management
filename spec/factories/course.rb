FactoryBot.define do
  factory :course do
    category
    school
    name { Faker::Educator.course_name }
    fee { 500 }
    description { Faker::Lorem.sentence }
    learn_content { Faker::Lorem.sentence }
    curriculam { Faker::Lorem.sentence }
    duration { '10 Weeks' }
    hours_per_day { '2 hours' }
  end
end
