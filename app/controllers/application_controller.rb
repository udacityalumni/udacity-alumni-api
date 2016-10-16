class ApplicationController < ActionController::API
  respond_to :json
  include Authenticatable
  include Pundit
end
