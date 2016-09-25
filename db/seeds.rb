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
# company_ids = Company.all.map{|company| company.id}
company_ids = []
Company.all.each do |company|
  company_ids << company.id
end

department_ids = []
department_names = []
Department.all.each do |department|
  department_ids << deparment.id
  department_names << deparment.department_name
end

20.times do
  dept_samp1 = department_ids.sample
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  password = Faker::Internet.password(8)
  user = User.create(
    first_name: first,
    last_name: last,
    email: first + '.' + last + Faker::Internet.free_email,
    password: password,
    password_confirmation: password,
    admin: Faker::Boolean.boolean(0.2),
    company_id: company_ids.sample,
    department_id: dept_samp1,
    department_name: dept_samp1.department_name
  )
end

user_names = []
User.each do |user|
  user_names << (user.first_name + " " + user.last_name)
end

User.all.each do |user|
  UserDepartment.create(user_id: user.id, department_id: department_ids.sample, company_id: company_ids.sample)
end

Company.all.each do |company|
  CompanyDepartment.create(company_id: company.id.sample, department_id: department_ids.sample)
end

30.times do
  dept_samp = department_ids.sample
  job = Job.create(
    job_title: Faker::Name.title,
    salary: Faker::Number.between(48000, 80000),
    description: Faker::Hipster.paragraphs,
    job_criteria_1: Faker::Hacker.adjective,
    job_criteria_2: Faker::Hacker.adjective,
    job_criteria_3: Faker::Hacker.adjective,
    job_criteria_4: Faker::Hacker.adjective,
    job_criteria_5: Faker::Hacker.adjective,
    projected_start_date: Faker::Date.forward(70),
    archive_status: Faker::Boolean.boolean,
    department_id: dept_samp,
    department_name: dept_samp.department_name,
    company_id: company_ids.sample,
    hiring_manager: user_names
  )
end

job_ids = []
Jobs.all.each do |job|
  job_ids << job.ids
end

100.times do
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
    job_criteria_5: Faker::Number.between(1, 5),
    job_id: job_ids.sample
  )
end
