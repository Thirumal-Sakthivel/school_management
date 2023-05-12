require 'rails_helper'

RSpec.describe Batch, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:school) }
    it { is_expected.to belong_to(:course) }
  end
end
