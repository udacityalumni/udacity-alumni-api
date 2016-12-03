module User
  extend ActiveSupport::Concern

  module ClassMethods
    def get_user_from_token(token)
      AuthenticationToken.find_by(body: token).user
    end
  end
end