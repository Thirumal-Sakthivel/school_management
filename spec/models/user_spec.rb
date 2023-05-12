require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:user_roles) }
    it { is_expected.to have_many(:roles) }
    it { is_expected.to belong_to(:school).optional }
  end

  describe 'validations' do
    context 'email' do
      before { create(:user) }

      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end

    context 'attributes presence' do
      let(:user) { build_stubbed(:user) }

      it 'is expected to return invalid record' do
        user.first_name = ''
        expect(user.valid?).to be_falsey
        expect(user.valid?).not_to be_truthy
      end

      it 'is expected to return invalid record' do
        user.last_name = ''
        expect(user.valid?).to be_falsey
        expect(user.valid?).not_to be_truthy
      end
    end
  end
end
