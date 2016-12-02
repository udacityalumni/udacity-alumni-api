class Api::V1::SessionsController < ApplicationController

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    # Find user by email (downcased!) <~~ Important!
    user = user_email.present? && User.find_by(email: user_email.downcase)
    if user && user.valid_password?(user_password)
      token = TokenIssuer.create_and_return_token(user, request)
      render status: :ok, json: { user_email: user.email, auth_token: token }
    else
      render json: { errors: 'Invalid email or password' }, status: 422
    end
  end

  def destroy
    auth_token = request.headers['Authorization']
    user = AuthenticationToken.find_by(body: auth_token).user
    if user
      TokenIssuer.expire_token(user, request)
      head 204
    else
      render json: { errors: 'An error occured while deleting the token' }, status: 404
    end
  end
end
