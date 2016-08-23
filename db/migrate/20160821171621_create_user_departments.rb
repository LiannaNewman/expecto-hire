class CreateUserDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_departments do |t|
      t.integer :company_id
      t.string :company_name

      t.timestamps
    end
  end
end
