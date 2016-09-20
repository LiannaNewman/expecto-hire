class JobsController < ApplicationController
    before_action :authenticate_user!

    def index
      @header = "Welcome"
      @jobs = Job.all
    end

    def dashboard
      if current_user.admin == true
        @departments = Department.where(user_department_id: params[:user_department_id])
      else
        @departments = Department.where(id: current_user.department_id)
      end
      @jobs = Job.where(department_id: params[:department_id])
      render 'dashboard.html.erb'
    end

    def new
      @header = "Create a New Job"
      @job = Job.new
      render 'new.html.erb'
    end

    def create
      @header = "Create a New Job"
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
      render "new.html.erb"
    end

    def show
      @job = Job.find_by(id: params[:id])
      @header = @job.job_title
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
      flash[:success] = "The #{@job.job_title} position has been deleted!"
      redirect_to "dashboard.html.erb"
    end

    def gen_rec
      @job = Job.find_by(id: params[:id])
      @header = "Recommendation Generator"
      @candidate = Candidate.find_by(job_id: params[:id])
    end

    def rec_generator(candidate_1, candidate_2)
      rec_generator = []
      total_criteria_ranking = @candidate.job_criteria_1 + @candidate.job_criteria_2 + @candidate.job_criteria_3 + @candidate.job_criteria_4 + @candidate.job_criteria_5
      if @candidate.final_candidate == true
        rec_generator << @candidate
        if @candidate_1.total_criteria_ranking > @candidate_2.total_criteria_ranking
          candidate_1.first_name + " " + candidate_1.last_name
        elsif @candidate_1.total_criteria_ranking == @candidate_2.total_criteria_ranking
          "Either " + candidate_1.first_name + " " + candidate_1.last_name + " or " + candidate_2.first_name + " " + candidate_2.last_name + " would be a good fit for the position."
        else
          candidate_2.first_name + " " + candidate_2.last_name
        end
      end
    end

end
