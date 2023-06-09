FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email  { Faker::Internet.email }
    password  { Faker::Alphanumeric.alpha(number: 10) }
  end
end
