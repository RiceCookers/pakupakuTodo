require 'rails_helper'

RSpec.describe User, type: :model do
  describe "valid?" do
    subject { user.valid? }

    let(:user) { User.new user_attributes }
    let(:user_attributes) { attributes_for(:user, overrides) }
    let(:overrides) { {} }

    context "with valid params" do
      it { is_expected.to be_truthy }
    end

    context "email nil" do
      let(:overrides) { { email: nil } }
      it { is_expected.to be_falsey }
    end

    context "password nil" do
      let(:overrides) { { password: nil } }
      it { is_expected.to be_falsey }
    end
  end
end