class WelcomesController < ApplicationController
  def index
    if current_user.nil?
      render 'index.html.erb'
    else
      redirect_to '/jobs'
    end
  end
end
