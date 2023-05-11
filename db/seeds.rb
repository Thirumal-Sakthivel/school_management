# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([{ name: 'admin' }, { name: 'school_admin' }, { name: 'student' }])

user = User.create(
  email: 'admin@myschool.com',
  password: 'password',
  user_name: Faker::Name.name.downcase.parameterize.underscore,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  dob: Faker::Date.birthday(min_age: 18, max_age: 50),
  gender: 'Male',
  street_address: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
  pin_code: Faker::Address.zip_code
)
UserRole.find_or_create_by(user_id: user.id, role_id: Role.find_by(name: 'Admin')&.id)

user = User.create(
  email: 's_admin@myschool.com',
  password: 'password',
  user_name: Faker::Name.name.downcase.parameterize.underscore,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  dob: Faker::Date.birthday(min_age: 18, max_age: 50),
  gender: 'Male',
  street_address: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
  pin_code: Faker::Address.zip_code
)
UserRole.find_or_create_by(user_id: user.id, role_id: Role.find_by(name: 'SchoolAdmin')&.id)

user = User.create(
  email: 'student@myschool.com',
  password: 'password',
  user_name: Faker::Name.name.downcase.parameterize.underscore,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  dob: Faker::Date.birthday(min_age: 18, max_age: 50),
  gender: 'Male',
  street_address: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
  pin_code: Faker::Address.zip_code
)
UserRole.find_or_create_by(user_id: user.id, role_id: Role.find_by(name: 'Student')&.id)

puts 'Created Records!'
