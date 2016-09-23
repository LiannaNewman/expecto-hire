class CreateCompanyDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :company_departments do |t|
      t.integer :company_id
      t.integer :department_id

      t.timestamps
    end
  end
end
