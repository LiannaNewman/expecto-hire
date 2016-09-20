class AddFeedbackAndTopCandidateAndChangeMoveForwardToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :feedback, :text
    add_column :candidates, :top_candidate?, :boolean
    change_column :candidates, :move_forward, :string
  end
end
