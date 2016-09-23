class Company < ApplicationRecord
  has_many :users
  has_many :jobs
  has_many :company_departments
  has_many :departments, through: :company_departments
end
