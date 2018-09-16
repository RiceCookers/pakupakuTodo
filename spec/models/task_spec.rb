require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "valid?" do
    subject { task.valid? }

    let(:task) { Task.new task_attributes }
    let(:task_attributes) { attributes_for(:task, overrides) }
    let(:overrides) { {} }

    context "with valid params" do
      it { is_expected.to be_truthy }
    end

    context "when name nil" do
      let(:overrides) { { name: nil } }
      it { is_expected.to be_falsey }
    end
  end
end
