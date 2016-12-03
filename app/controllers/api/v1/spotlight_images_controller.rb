class Api::V1::SpotlightImagesController < ApplicationController

  # Return all spotlight_images
  def index
    all_spotlight_images = SpotlightImage.all

    if all_spotlight_images
      render json: {
          spotlight_images: ActiveModel::Serializer::CollectionSerializer.new(
              all_spotlight_images,
              each_serializer: SpotlightImageSerializer,
              root: false
          )
      }
    else
      render json: { errors: 'Invalid request' }, status: :unprocessable_entity
    end
  end

  # Create a new spotlight image
  def create
    auth_token = request.headers['Authorization']
    user = User.get_user_from_token(auth_token)
    spotlight_image = user.spotlight_images.build(spotlight_image_params)
    if spotlight_image.save
      render json: spotlight_image,
             status: 201,
             location: :api_v1_spotlight_images
    else
      render json: { errors: 'Invalid Request' }, status: :unprocessable_entity
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
        render json: { errors: 'Invalid Request' }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'Invalid Request' }, status: :unprocessable_entity
    end
  end

  private

  # Spotlight_Image params accepted at this point for creating
  # a spotlight_image are as shown:
  def spotlight_image_params
    params.require(:spotlight_image).permit(:url, :user)
  end
end
