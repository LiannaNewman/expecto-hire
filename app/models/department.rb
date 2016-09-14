class Department < ApplicationRecord
  belongs_to :company
  belongs_to :user_department
  has_many :jobs
  has_many :users
end
