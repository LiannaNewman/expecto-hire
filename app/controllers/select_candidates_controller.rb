class SelectCandidatesController < ApplicationController
  before_action :authenticate_user!, :except => [:new, :create]
  def index
    @company = Company.find_by(id: params[:company_id])
    @job = Job.find_by(id: params[:job_id])
    @header = "#{@job.job_title} - Candidate List"
    @candidates = @job.candidates
  end

  def new
    @company = Company.find_by(id: params[:company_id])
    @job = Job.find_by(id: params[:job_id])
    @candidate = Candidate.new
    render 'new'
  end

  def create
      @company = Company.find_by(id: params[:company_id])
      @job = Job.find_by(id: params[:job_id])
      @candidate = Candidate.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        phone: params[:phone],
        resume: params[:resume],
        cover_letter: params[:cover_letter],
        references: params[:references],
        move_forward: params[:move_forward],
        status: params[:status],
        job_criteria_1: params[:job_criteria_1],
        job_criteria_2: params[:job_criteria_2],
        job_criteria_3: params[:job_criteria_3],
        job_criteria_4: params[:job_criteria_4],
        job_criteria_5: params[:job_criteria_5],
        job_id: @job.id
      )
      render 'thank_you'
  end

  def show
    @candidate = Candidate.find_by(job_id: params[:job_id])
    render 'show'
  end

  def edit
    @header = "Update Candidate"
    @company = Company.find_by(id: params[:company_id])
    @job = Job.find_by(id: params[:job_id])
    @candidate = Candidate.find_by(id: params[:candidate_id])
    render 'edit'
  end

  def update
    @company = Company.find_by(id: params[:company_id])
    @job = Job.find_by(id: params[:job_id])
    @candidate = Candidate.find_by(id: params[:candidate_id])
    @candidate.update(
      move_forward: params[:move_forward],
      status: params[:status],
      job_criteria_1: params[:job_criteria_1],
      job_criteria_2: params[:job_criteria_2],
      job_criteria_3: params[:job_criteria_3],
      job_criteria_4: params[:job_criteria_4],
      job_criteria_5: params[:job_criteria_5],
      top_candidate?: params[:top_candidate?],
      total_criteria: ((params[:job_criteria_1]).to_i + (params[:job_criteria_2]).to_i + (params[:job_criteria_3]).to_i + (params[:job_criteria_4]).to_i + (params[:job_criteria_5]).to_i),
      feedback: params[:feedback]
    )
    redirect_to "/company/#{@company.id}/jobs/#{@candidate.job.id}/select_candidates"
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:candidate_id])
    @candidate.destroy
    render 'index.html.erb'
  end

end
