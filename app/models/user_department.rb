class UserDepartment < ApplicationRecord
  has_many :users
  has_many :departments
end
