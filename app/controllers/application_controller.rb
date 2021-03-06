class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_header

  protected

  def set_header
    @header = "Expecto Hire"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :encrypted_password, :department_name, :department_id, :company_id) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :encrypted_password, :department_name, :department_id) }
  end
  
end
