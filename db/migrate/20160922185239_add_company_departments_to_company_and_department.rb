class AddCompanyDepartmentsToCompanyAndDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :departments, :company_departments, :integer
    add_column :companies, :company_departments, :integer
  end
end
