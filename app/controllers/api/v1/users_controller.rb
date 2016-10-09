class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token

  def show
    current_user = User.find_by(auth_token: params[:auth_token])
    if current_user
      respond_with current_user, serializer: UserSerializer
    else
      render json: { errors: 'Invalid request' }, status: 422
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api_v1, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    if current_user.update(user_params)
      render json: current_user,
             serializer: UserSerializer,
             status: 200,
             location: [:api_v1, current_user]
    else
      render json: { errors: current_user.errors }, status: 422
    end
  end

  private

  # User params accepted at this point for creating a user are as shown:
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :bio,
                                 :email, :name, :avatar)
  end
end
