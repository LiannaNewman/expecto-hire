class RemoveCompanyDepartmentsFromCompanyAndDepartment < ActiveRecord::Migration[5.0]
  def change
    remove_column :departments, :company_departments, :integer
    remove_column :departments, :company_name, :string
    remove_column :departments, :company_id, :integer
    remove_column :departments, :user_department_id, :integer
    remove_column :companies, :company_departments, :integer
  end
end
