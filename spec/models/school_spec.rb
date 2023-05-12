require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:courses) }
    it { is_expected.to have_many(:batches) }
    it { is_expected.to have_many(:enrollments) }
    it { is_expected.to have_many(:users) }
  end

  describe 'validations' do
    context 'attributes' do
      let(:school) { build_stubbed(:school) }

      it 'is expected to return invalid record' do
        school.name = ''
        expect(school.valid?).to be_falsey
      end

      it 'is expected to return invalid record' do
        school.email = ''
        expect(school.valid?).to be_falsey
      end
    end
  end
end
