class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  private

    def sign_in(user)
      session[:user_id] = user.id
    end

    def signed_in?
      current_user.present? && current_user.is_a?(User)
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def require_signed_in
      redirect_to new_user_path unless signed_in?
    end
end
