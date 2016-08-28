class AddUserIdAndDepartmentIdtoUserDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :user_departments, :user_id, :integer
    add_column :user_departments, :department_id, :integer
    remove_column :user_departments, :company_name, :string
  end
end
