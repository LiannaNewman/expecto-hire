class AddFeedbackAndTopCandidateToSelectCandidates < ActiveRecord::Migration[5.0]
  def add_feedback
    add_column :select_candidates, :feedback, :text
  end

  def add_top_cand
    add_column :select_candidates, :top_candidate?, :boolean
  end

  def change_move_fwd
    change_column :select_candidates, :move_forward, :string
  end
end
