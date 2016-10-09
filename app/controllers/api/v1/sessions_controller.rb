class Api::V1::SessionsController < ApplicationController

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    # Find user by email (downcased!) <~~ Important!
    user = user_email.present? && User.find_by(email: user_email.downcase)
    if user && user.valid_password?(user_password)
      sign_in_user! user
      render json: user, serializer: SessionSerializer, status: 200, location: [:api_v1, user]
    else
      render json: { errors: 'Invalid email or password' }, status: 422
    end
  end

  def destroy
    auth_token = params[:auth_token] || request.headers['Authorization']
    user = User.find_by(auth_token: auth_token)
    if user
      user.generate_auth_token!
      user.save
      head 204
    else
      render json: { errors: 'That token was already destroyed' }, status: 404
    end
  end

  private

  def sign_in_user!(user)
    sign_in user, store: false
    user.generate_auth_token!
    user.save
  end
end
