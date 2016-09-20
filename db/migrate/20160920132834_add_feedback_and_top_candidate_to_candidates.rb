class AddFeedbackAndTopCandidateToCandidates < ActiveRecord::Migration[5.0]
  def add_feedback
    add_column :candidates, :feedback, :text
  end

  def add_top_cand
    add_column :candidates, :top_candidate?, :boolean
  end

  def change_move_fwd
    change_column :candidates, :move_forward, :string
  end
end
