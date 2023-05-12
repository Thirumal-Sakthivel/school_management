FactoryBot.define do
  factory :school do
    name { Faker::Name.first_name }
    email  { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number_with_country_code }
    office_phone {  Faker::PhoneNumber.phone_number_with_country_code }
    description { Faker::Lorem.sentence }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    pin_code { Faker::Address.zip_code }
    facilities { Faker::Lorem.sentence }
  end
end
