require 'spec_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #show' do
    context "when valid auth token" do
      before(:each) do
        @user = FactoryGirl.create :user
        request.headers['Authorization'] = @user.auth_token
        get :show, format: :json
      end
      it 'returns a user object' do
        expect(json_response[:user][:email]).to eql @user.email
      end
      it { should respond_with 200 }
    end
    context "when invalid auth token" do
      before(:each) do
        @user = FactoryGirl.create :user
        request.headers['Authorization'] = 'foobared😖'
        get :show, format: :json
      end
      it 'returns a user object' do
        @error = 'Invalid request'
        expect(json_response[:errors]).to eql @error
      end
      it { should respond_with 422 }
    end
  end
  describe 'POST #create' do

    context "when user is created successfully" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }, format: :json
      end
      it "renders the json representation for the user" do
        expect(json_response[:user][:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when user is not created successfully" do
      before(:each) do
        @invalid_user_attributes = { password: '12345678',
                                     password_confirmation: '87654321' }
        post :create, { user: @invalid_user_attributes }, format: :json
      end
      it 'renders errors as json' do
        expect(json_response).to have_key(:errors)
      end
      it { should respond_with 422 }
    end
  end
end
