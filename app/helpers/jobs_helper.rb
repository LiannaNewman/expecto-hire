module JobsHelper
  def job_dept_id(user)
    if current_user && current_user.department_id != nil
      Job.find_by(department_id: user.department_id)
    end
  end
end
