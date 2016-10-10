require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  describe 'has expected columns with expected options' do
    it { should have_db_column(:tag).of_type(:string).with_options(null: false) }
  end
  
end
