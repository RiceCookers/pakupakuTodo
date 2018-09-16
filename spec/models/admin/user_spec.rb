require 'rails_helper'

RSpec.describe Admin::User, type: :model do
  describe "valid?" do
    subject { admin_user.valid? }

    let(:admin_user) { Admin::User.new admin_user_attributes }
    let(:admin_user_attributes) { attributes_for(:admin_user, overrides) }
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
