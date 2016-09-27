require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'has expected columns with expected options' do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:email).of_type(:string).with_options(null: false) }
    it { should have_db_column(:avatar).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options(null: false, default: '') }
    it { should have_db_column(:reset_password_token).of_type(:string).with_options(null: true, default: '') }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime).with_options(null: true) }
    it { should have_db_column(:remember_created_at).of_type(:datetime).with_options(null: true) }
    it { should have_db_column(:sign_in_count).of_type(:integer).with_options(null: false, default: 0) }
    it { should have_db_column(:current_sign_in_at).of_type(:datetime).with_options(null: true) }
    it { should have_db_column(:last_sign_in_at).of_type(:datetime).with_options(null: true) }
    it { should have_db_column(:current_sign_in_ip).of_type(:inet).with_options(null: true) }
    it { should have_db_column(:last_sign_in_ip).of_type(:inet).with_options(null: true) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
  # TODO: Add tests for behavior and also for the authorization policies
end
