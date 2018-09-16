require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "#new" do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      get :new
    end

    it { expect(response).to have_http_status :ok }
  end

  describe "#create" do
    let(:user) { create(:user) }
    let(:params) { { task: task_attributes } }

    before { sign_in(user) }

    context "with valid params" do
      let(:task_attributes) { attributes_for(:task) }

      it { expect{ post :create, params: params }.to change { Task.count }.by(1) }
    end

    context "with valid params" do
      let(:task_attributes) { attributes_for(:task, name: nil) }

      it { expect{ post :create, params: params }.not_to(change { Task.count }) }
    end
  end

  describe "#update" do
    let(:user) { create(:user) }
    let(:task) { create(:task, user: user) }
    let(:params) { { id: task.id, task: task_attributes } }
    let(:task_attributes) { { state: :closed } }

    before do
      sign_in user
      patch :update, params: params
    end

    context "with state" do
      it { expect(task.reload.state).to eq("closed") }
    end
  end
end