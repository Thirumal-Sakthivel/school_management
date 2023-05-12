require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:school) }
    it { is_expected.to belong_to(:course) }
    it { is_expected.to belong_to(:batch) }
  end
end
