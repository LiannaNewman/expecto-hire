class SelectCandidatesController < ApplicationController
    before_action :authenticate_user!
  def index
    @header = "Candidate List"
    @candidates = Candidate.where(job_id: params[:id])
  end

  def new
    @candidate = Candidate.new
    render 'new'
  end

  def create
    @candidate = @job.candidate.create(
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
      job_criteria_5: params[:job_criteria_5]
    )
    render 'show'
  end

  def show
    @candidate = Candidate.find_by(job_id: params[:job_id])
    render 'show'
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
    render 'edit'
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.update(
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
      job_criteria_5: params[:job_criteria_5]
    )
    render 'show'
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    render 'index.html.erb'
  end

  def gen_rec
    @candidate = Candidate.find_by(job_id: params[:id])
    if @candidate.job_criteria_1 + @candidate.job_criteria_2 + @candidate.job_criteria_3 + @candidate.job_criteria_4 + @candidate.job_criteria_5
    end
  end

end
