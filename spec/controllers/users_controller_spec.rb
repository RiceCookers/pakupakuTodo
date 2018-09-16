require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    before { get :new }

    it { expect(response).to have_http_status :ok }
  end

  describe "#create" do
    let(:params) { { user: user_attributes } }

    context "with valid params" do
      let(:user_attributes) { attributes_for(:user) }

      it { expect{ post :create, params: params }.to change { User.count }.by(1) }
    end

    context "with valid params" do
      let(:user_attributes) { attributes_for(:user, email: nil) }

      it { expect{ post :create, params: params }.not_to(change { User.count }) }
    end
  end
end