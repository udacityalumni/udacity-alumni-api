module UserConcerns
  extend ActiveSupport::Concern

  module ClassMethods
    def get_user_from_token(token)
      auth_token = AuthenticationToken.find_by(body: token)
      if auth_token && auth_token.user
        auth_token.user
      end
    end
  end
end
