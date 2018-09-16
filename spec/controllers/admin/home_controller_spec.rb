require 'rails_helper'

RSpec.describe Admin::HomeController, type: :controller do
  describe "#index" do
    context "with admin_user" do
      let(:admin_user) { create(:admin_user) }

      before do
        admin_sign_in admin_user
        get :index
      end

      it { expect(response).to have_http_status :ok }
    end

    context "without admin_user" do
      before { get :index }

      it { expect(response).to redirect_to new_admin_session_path }
    end

    context "with user" do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :index
      end

      it { expect(response).to redirect_to new_admin_session_path }
    end
  end
end