require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:tags) }
  end
  it 'is not valid without a title' do
    expect(
      Article.new(content: 'Yahoo!')
    ).to_not be_valid
  end
  it 'is not valid without content' do
    expect(
      Article.new(title: 'Hello World')
    ).to_not be_valid
  end
  it 'sets the status to draft by default' do
    expect(
      Article.new.status
    ).to eq('draft')
  end
end
