class Api::V1::SessionsController < ApplicationController

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    # Find user by email (downcased!) <~~ Important!
    user = user_email.present? && User.find_by(email: user_email.downcase)
    if user && user.valid_password?(user_password)
      token = TokenIssuer.create_and_return_token(user, request)
      session = { auth_token: token }
      render status: :ok, json: { session: session }
    else
      render json: { errors: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  def destroy
    auth_token = request.headers['Authorization']
    user = User.get_user_from_token(auth_token)
    if user
      TokenIssuer.expire_token(user, request)
      head 204
    else
      render json: { errors: 'An error occured while deleting the token' }, status: :not_found
    end
  end
end
