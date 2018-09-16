class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  private

    def sign_in(user)
      session[:user_id] = user.id
    end

    def signed_in?
      current_user.present?
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
end
