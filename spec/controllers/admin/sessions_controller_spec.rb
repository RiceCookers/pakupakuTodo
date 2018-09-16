require 'rails_helper'

RSpec.describe Admin::SessionsController, type: :controller do
  describe "#create" do
    context "valid params" do
      let(:admin_user) { create(:admin_user, password: password, password_confirmation: password) }
      let(:password) { "password" }
      let(:params) { { email: admin_user.email, password: password } }

      before do
        post :create, params: params
      end

      it do
        expect(response).to redirect_to admin_root_path
      end
    end

    context "invalid email" do
      let(:admin_user) { create(:admin_user, password: password, password_confirmation: password) }
      let(:password) { "password" }
      let(:params) { { email: admin_user.email + "invalid", password: password } }

      before do
        post :create, params: params
      end

      it { expect(response).to redirect_to new_admin_session_path }
    end

    context "invalid password" do
      let(:admin_user) { create(:admin_user, password: password, password_confirmation: password) }
      let(:password) { "password" }
      let(:params) { { email: admin_user.email, password: password + "password" } }

      before do
        post :create, params: params
      end

      it { expect(response).to redirect_to new_admin_session_path }
    end
  end
end
