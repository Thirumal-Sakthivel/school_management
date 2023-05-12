require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:school) }
    it { is_expected.to belong_to(:category) }
  end

  context 'validate attributes' do
    let(:course) { create(:course) }

    it 'name should be present' do
      expect(course.name.present?).to be_truthy
    end
  end
end
