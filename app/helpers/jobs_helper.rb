module JobsHelper
  def job_dept_id(user)
    if current_user && current_user.department_id != nil
      Job.find_by(department_id: user.department_id)
    end
  end

  def display_name(user)
    if current_user != nil
      User.find_by(id: user.id)
      user.first_name
    end
  end

  def recommended_candidates
    # Candidate.where(total_criteria: Candidate.maximum('total_criteria') && @candidate.job_id == params[:job_id])
    @candidate = Candidate.where(job_id: params[:job_id])
    @candidate.where(total_criteria: @candidate.maximum("total_criteria"))
  end
end
