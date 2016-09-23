class OmniauthCallbacksController < ApplicationController
  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    if @user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      redirect_to "/jobs/dashboard"
    else
      redirect_to new_user_session_path, notice: 'Please sign-in to utilize google calendar'
    end
  end
end
