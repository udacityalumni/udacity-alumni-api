require 'rails_helper'

RSpec.describe Feedback, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
  end
  it 'is not valid without a description' do
    expect(
      Feedback.new(url: 'Yahoo.com')
    ).to_not be_valid
  end
end
