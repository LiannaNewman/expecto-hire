class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_header

  def set_header
    @header = "This is the companies page!"
  end
end
