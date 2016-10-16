require 'spec_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'POST #create' do
    before(:each) do
      @user = FactoryGirl.create :user
    end
    context 'when the credentials are correct' do
      before(:each) do
        credentials = { email: @user.email, password: @user.password }
        post :create, params: { session: credentials }, format: :json
      end

      it 'returns a response with a session and auth token' do
        @user.reload
        expect(json_response[:session][:auth_token]).to eql @user.auth_token
      end
    end
    context 'when the credentials are incorrect' do
      before(:each) do
        credentials = { email: @user.email, password: 'wrongpassword' }
        post :create, params: { session: credentials }, format: :json
      end
      it 'returns a json object with an error' do
        expect(json_response[:errors]).to eql 'Invalid email or password'
      end
      it { should respond_with 422 }
    end
  end
end
