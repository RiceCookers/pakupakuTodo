class Admin::SessionsController < Admin::ApplicationController

  def create
    @admin_user = Admin::User.find_by(email: session_params[:email])
    if @admin_user&.authenticate(session_params[:password])
      sign_in(@admin_user)
      redirect_to session[:target_url] || admin_root_path
    else
      flash[:error] = "Email/Password not match"
      redirect_to new_admin_session_path
    end
  end

  private

    def session_params
      params.permit(:email, :password)
    end
end
