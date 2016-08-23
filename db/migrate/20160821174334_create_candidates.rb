class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.integer :job_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :resume
      t.string :cover_letter
      t.string :references
      t.boolean :move_forward
      t.string :status
      t.integer :job_criteria_1
      t.integer :job_criteria_2
      t.integer :job_criteria_3
      t.integer :job_criteria_4
      t.integer :job_criteria_5

      t.timestamps
    end
  end
end
