class JobsController < ApplicationController
  def index
    @jobs = Job.all
    render 'index.html.erb'
  end

  def new
    @job = Job.new
    render 'new.html.erb'
  end

  def create
    @job = Job.create(
      job_title: params[:job_title],
      department_name: params[:department_name],
      salary: params[:salary],
      description: params[:description],
      job_criteria_1: params[:job_criteria_1],
      job_criteria_2: params[:job_criteria_2],
      job_criteria_3: params[:job_criteria_3],
      job_criteria_4: params[:job_criteria_4],
      job_criteria_5: params[:job_criteria_5],
      stage: params[:stage],
      projected_start_date: params[:projected_start_date],
      timeline_status: params[:timeline_status],
      archive_status: params[:archive_status]
    )
  end

  def show
    @job = Job.find_by(id: params[:id])
    render "show"
  end

  def edit
    @job = Job.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @job = Job.find_by(id: params[:id])
    @job.update(
      department_id: params[:department_id],
      job_title: params[:job_title],
      department_name: params[:department_name],
      salary: params[:salary],
      description: params[:description],
      job_criteria_1: params[:job_criteria_1],
      job_criteria_2: params[:job_criteria_2],
      job_criteria_3: params[:job_criteria_3],
      job_criteria_4: params[:job_criteria_4],
      job_criteria_5: params[:job_criteria_5],
      stage: params[:stage],
      projected_start_date: params[:projected_start_date],
      timeline_status: params[:timeline_status],
      archive_status: params[:archive_status]
    )
    render "show"
  end

  def destroy
    @job = Job.find_by(id: params[:id])
    @job.destroy
  end
end
