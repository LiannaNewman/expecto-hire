class UserDepartment < ApplicationRecord
  belongs_to :users
  belongs_to :departments
end
