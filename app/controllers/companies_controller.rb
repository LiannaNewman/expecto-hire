class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_header

  def new
    @header = "Register Your Company"
    @company = Company.new
  end

  def create
    @company = Company.create(
      company_name: params[:company_name]
    )
    render "new.html.erb"
  end

  def destroy
    if current_user.admin? == true
      @company = Company.find_by(id: params[:id])
      @company.destroy
      flash[:success] = "The #{@company.company_name} company has been deleted!"
      redirect_to "/"
    end
  end

end
