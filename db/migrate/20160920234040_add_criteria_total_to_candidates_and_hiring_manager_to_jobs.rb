class AddCriteriaTotalToCandidatesAndHiringManagerToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :total_criteria, :integer
    add_column :jobs, :hiring_manager, :string
  end
end
