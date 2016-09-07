class Jobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :department_id
      t.string :job_title
      t.string :department_name
      t.integer :salary
      t.text :description
      t.string :job_criteria_1
      t.string :job_criteria_2
      t.string :job_criteria_3
      t.string :job_criteria_4
      t.string :job_criteria_5
      t.string :stage
      t.date :projected_start_date
      t.string :timeline_status
      t.boolean :archive_status

      t.timestamps
    end
  end
end
