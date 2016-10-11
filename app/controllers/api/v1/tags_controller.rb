class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]
  respond_to :json
    
  # GET /tags
  def index
    @tags = Tag.all

    render json: @tags
  end

  # GET /tag/#
  def show
    render json: @tag
  end
    
  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created, location: :api_v1_tags
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /tags/#
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/#
  def destroy
    @tag.destroy
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tag_params
    params.require(:tag).permit(:tag)
  end

end
