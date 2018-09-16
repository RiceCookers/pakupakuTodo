# frozen_string_literal: true

module AdminSignIn
  def admin_sign_in(admin_user = create(:admin_user))
    controller.instance_variable_set(:@current_user, admin_user)
  end
end