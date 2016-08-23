class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :department_name
      t.string :company_name
      t.integer :company_id
      t.integer :user_department_id

      t.timestamps
    end
  end
end
