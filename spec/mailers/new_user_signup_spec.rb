require "rails_helper"

RSpec.describe NewUserSignupMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = create(:user, email: "user@example.com")
    NewUserSignupMailer.welcome_email(@user).deliver_now
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'renders the receiver email' do
    expect(ActionMailer::Base.deliveries.first.to).to eq(["user@example.com"])
  end

  it 'should set the subject to the correct subject' do
    expect(ActionMailer::Base.deliveries.first.subject).to eq('Thank you for joining Udacity alumni network!')
  end

  it 'renders the sender email' do
    expect(ActionMailer::Base.deliveries.first.from).to eq(["udacity-alumni@udacity.com"])
  end

end
