module Authenticatable
  def current_user
    @current_user ||= AuthenticationToken.find_by(body: request.headers['Authorization']).user
  end

  def authenticate_with_token!
    render json: { errors: 'Not authenticated' }, status: :unauthorized unless current_user.present?
  end

  def user_signed_in?
    current_user.present?
  end
end
