require 'rails_helper'

RSpec.describe ArticleStatus, type: :model do
  describe 'has title column' do
    it { should have_db_column(:title).of_type(:string).with_options(null: false) }
  end
end
