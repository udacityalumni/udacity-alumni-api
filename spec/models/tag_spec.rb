require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  describe 'has expected columns with expected options' do
    it { should have_db_column(:tag).of_type(:string).with_options(null: false) }
  end
  
  it { should validate_presence_of :tag }
  
  it 'is not valid without a tag' do
    expect(
      Tag.new()
    ).to_not be_valid
  end
  
end
