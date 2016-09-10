class SelectCandidatesController < ApplicationController

  def index
    @header = "Here is the List of the candidates for 'Job Title'"
    @candidate = Candidate.all
    render 'index'
  end

  def new
    @candidate = Candidate.new
    render 'new'
  end

  def create
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
      job_criteria_5: params[:job_criteria_5]
    )
    render 'show'
  end

  def show
    @candidate = Candidate.find_by(id: params[:id])
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
end
