class Department < ApplicationRecord
  has_many :user_departments
  has_many :jobs
  has_many :users, through: :user_departments
  has_many :company_departments
  has_many :companies, through: :company_departments
end
