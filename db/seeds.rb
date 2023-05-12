# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([{ name: 'admin' }, { name: 'school_admin' }, { name: 'student' }])

school = School.create(
  name: Faker::Educator.university,
  email: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  office_phone:  Faker::PhoneNumber.phone_number_with_country_code,
  website: '',
  description: Faker::Lorem.sentence,
  street_address: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
  pin_code: Faker::Address.zip_code,
  delivery_method: '',
  facilities: Faker::Lorem.sentence
)

admin_user = User.create(
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
UserRole.find_or_create_by(user_id: admin_user.id, role_id: Role.find_by(name: 'admin')&.id)

sa_user = User.create(
  email: 'school_admin@myschool.com',
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
  pin_code: Faker::Address.zip_code,
  school_id: school.id
)
UserRole.find_or_create_by(user_id: sa_user.id, role_id: Role.find_by(name: 'school_admin')&.id)

student = User.create(
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
UserRole.find_or_create_by(user_id: student.id, role_id: Role.find_by(name: 'student')&.id)

10.times do 
  category = Category.create(
    name: Faker::Educator.subject,
    description: Faker::Lorem.sentence
  )

  course = Course.create(
    name: Faker::Educator.course_name,
    fee: 500,
    description: Faker::Lorem.sentence,
    category_id: category.id,
    school_id: school.id,
    learn_content: Faker::Lorem.sentence,
    curriculam: Faker::Lorem.sentence,
    duration: '10 Weeks',
    hours_per_day: '2 hours'
  )

  batch = Batch.create(
    name: Faker::Educator.degree,
    description: Faker::Lorem.sentence,
    school_id: school.id,
    course_id: course.id,
    start_time: Time.now,
    end_time: Time.now + 2.days
  )

  enroll = Enrollment.create(
    enrollment_date: Time.now,
    school_id: school.id,
    course_id: course.id,
    batch_id: batch.id,
    student_id: student.id,
    status: 0
  )
end


puts 'Created Records!'
