require 'rails_helper'

RSpec.describe Api::V1::GraphqlController, type: :controller do
  describe "#execute" do
    let(:user) { create(:user) }
    let(:token) { double(acceptable?: true, resource_owner_id: user.id) }
    let(:params) { { query: '{ user { id email } }' } }
    let(:result) { JSON.parse response.body }

    before do
      allow(controller).to receive(:doorkeeper_token).and_return(token)
      post :execute, params: params
    end

    it { expect(result["data"]["user"]["email"]).to eq user.email }
  end
end