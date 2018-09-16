class Admin::ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?
  layout "admin/application"

  private

    def sign_in(admin_user)
      session[:admin_user_id] = admin_user.id
    end

    def signed_in?
      current_user.present?
    end

    def current_user
      @current_user ||= Admin::User.find_by(id: session[:admin_user_id])
    end

    def require_signed_in
      redirect_to new_admin_session_path unless signed_in?
    end
end