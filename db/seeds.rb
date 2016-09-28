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

department_ids = [{1 => "Human Resources"}, {2 => "External Potions"}, {3 => "Magic Programs"}, {4 => "Muggle Relations"}, {5 => "Divination"}]

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
    department_id: department_ids.index(dept_samp1) + 1,
    department_name: dept_samp1.values.to_s
  )
end

User.all.each do |user|
  UserDepartment.create(user_id: user.id, department_id: department_ids.sample, company_id: company_ids.sample)
end

Company.all.each do |company|
  CompanyDepartment.create(company_id: company_ids.sample, department_id: department_ids.sample)
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
    department_id: department_ids.index(dept_samp) + 1,
    department_name: dept_samp.values.to_s,
    company_id: company_ids.sample
  )
end

job_ids = []
Job.all.each do |job|
  job_ids << job.id
end

mv_fwd = ['Yes', 'No', 'Maybe']
status_update = ['Prescreens', 'Phone Screens', 'Interivews', 'Reference Checks', 'Offers']

100.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  jc1 = Faker::Number.between(1, 5)
  jc2 = Faker::Number.between(1, 5)
  jc3 = Faker::Number.between(1, 5)
  jc4 = Faker::Number.between(1, 5)
  jc5 = Faker::Number.between(1, 5)
  candidate = Candidate.create(
    first_name: first,
    last_name: last,
    email: first + "." + last + Faker::Internet.free_email,
    phone: Faker::PhoneNumber.cell_phone,
    resume: 'http://i0.wp.com/www.resumewriting.net/formatsample1a.gif',
    cover_letter: 'http://i0.wp.com/writenwrite.com/wp-content/uploads/MBA-Cover-Letter-Sample-for-Investment-Service-Job.jpg',
    references: 'http://i0.wp.com/img.docstoccdn.com/thumb/orig/2461901.png',
    move_forward: mv_fwd.sample,
    status: status_update.sample,
    feedback: Faker::Hipster.paragraphs,
    job_criteria_1: jc1,
    job_criteria_2: jc2,
    job_criteria_3: jc3,
    job_criteria_4: jc4,
    job_criteria_5: jc5,
    total_criteria: jc1 + jc2 + jc3 + jc4 + jc5,
    job_id: job_ids.sample,
    top_candidate?: Faker::Boolean.boolean(0.2)
  )
end
