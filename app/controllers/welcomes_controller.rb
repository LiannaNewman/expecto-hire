class WelcomesController < ApplicationController
  def index
    if current_user.nil?
      render 'index.html.erb'
    else
      redirect_to '/company/current_user.company_id/jobs'
    end
  end
end
