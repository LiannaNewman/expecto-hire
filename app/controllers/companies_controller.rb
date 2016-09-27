class CompaniesController < ApplicationController
  before_action :authenticate_user!, :except => [:new, :create, :show]
  before_filter :set_header

  def new
    @header = "Register Your Company"
    @company = Company.new
  end

  def create
    @company = Company.create(
      company_name: params[:company_name],
      logo: params[:logo]
    )
    render "show.html.erb"
  end

  def show
    @companies = Company.all
  end

  def edit
    @company = Company.find_by(id: params[:company_id])
    if params[:company_id].to_i == current_user.company_id && current_user.admin? == true
      render "edit"
    else
      flash[:alert] = "You are not authorized to make updates to the selected company/organization!"
      redirect_to "/companies/registered"
    end
  end

  def update
    @company = Company.find_by(id: params[:company_id])
    @company.update(
      company_name: params[:company_name],
      logo: params[:logo]
    )
    redirect_to "show.html.erb"
  end

  def destroy
    if current_user.admin? == true
      @company = Company.find_by(id: params[:company_id])
      @company.destroy
      flash[:success] = "The #{@company.company_name} company has been deleted!"
      redirect_to "/"
    end
  end

end
