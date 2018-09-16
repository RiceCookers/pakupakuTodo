# frozen_string_literal: true

module SignIn
  def sign_in(user = create(:user))
    controller.instance_variable_set(:@current_user, user)
  end
end