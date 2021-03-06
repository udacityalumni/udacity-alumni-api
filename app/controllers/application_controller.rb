class ApplicationController < ActionController::API
  respond_to :json
  include Pundit
  include Authenticatable
  # prepare Devise to accept json requests
#   protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
end
