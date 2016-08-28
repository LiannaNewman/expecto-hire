# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  company = Company.create(
    company_name: Faker::Company.name,
    logo: Faker::Company.logo
  )
end

department = Department.create([
  {department_name: "Human Resources"},
  {department_name: "External Potions"},
  {department_name: "Magic Programs"},
  {department_name: "Muggle Relations"},
  {department_name: "Divination"}
])

100.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  password = Faker::Internet.password(8)
  user = User.create(
    first_name: first,
    last_name: last,
    email: first + '.' + last + Faker::Internet.free_email,
    password: password,
    password_confirmation: password,
    admin: Faker::Boolean.boolean(0.2)
  )
end

User.all.each do |user|
  UserDepartment.create(user_id: user.id, department_id: Department.all.sample.id, company_id: Company.all.sample.id)
end

80.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  candidate = Candidate.create(
    first_name: first,
    last_name: last,
    email: first + "." + last + Faker::Internet.free_email,
    phone: Faker::PhoneNumber.cell_phone,
    resume: Faker::Internet.url('example.com'),
    cover_letter: Faker::Internet.url('example.com'),
    references: Faker::Internet.url('example.com'),
    move_forward: Faker::Boolean.boolean,
    job_criteria_1: Faker::Number.between(1, 5),
    job_criteria_2: Faker::Number.between(1, 5),
    job_criteria_3: Faker::Number.between(1, 5),
    job_criteria_4: Faker::Number.between(1, 5),
    job_criteria_5: Faker::Number.between(1, 5)
  )
end

15.times do
  job = Job.create(
    job_title: Faker::Name.title,
    salary: Faker::Number.between(48000, 80000),
    job_criteria_1: Faker::Hacker.adjective,
    job_criteria_2: Faker::Hacker.adjective,
    job_criteria_3: Faker::Hacker.adjective,
    job_criteria_4: Faker::Hacker.adjective,
    job_criteria_5: Faker::Hacker.adjective,
    projected_start_date: Faker::Date.forward(70),
    archive_status: Faker::Boolean.boolean
  )
end
