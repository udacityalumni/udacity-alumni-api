class Api::V1::SpotlightImagesController < ApplicationController

  # Return all spotlight_images
  def index
    auth_token = request.headers['Authorization']
    all_spotlight_images = SpotlightImage.all

    if auth_token
      render json: {
        spotlight_images: ActiveModel::Serializer::CollectionSerializer.new(
          all_spotlight_images,
          each_serializer: SpotlightImageSerializer,
          root: false
        )
      }
    else
      render json: { errors: 'Invalid request' }, status: 422
    end
  end

  # Create a new spotlight image
  def create
    auth_token = request.headers['Authorization']
    user = User.find_by(auth_token: auth_token)
    spotlight_image = user.spotlight_images.build(spotlight_image_params)
    if spotlight_image.save
      render json: spotlight_image,
             status: 201,
             location: :api_v1_spotlight_images
    else
      render json: { errors: 'Invalid Request' }, status: 422
    end
  end

  def delete
    auth_token = request.headers['Authorization']
    if auth_token.valid?
    spotlight_image = SpotlightImage.find_by_id(params[:id])
    if spotlight_image
      render json: spotlight_image,
             status: 201,
             location: :api_v1_spotlight_images
    else
      render json: { errors: 'Invalid Request' }, status: 422
    end
    else
      render json: { errors: 'Invalid Request' }, status: 422
    end
  end

  private

  # Spotlight_Image params accepted at this point for creating
  # a spotlight_image are as shown:
  def spotlight_image_params
    params.require(:spotlight_image).permit(:url, :user)
  end
end
