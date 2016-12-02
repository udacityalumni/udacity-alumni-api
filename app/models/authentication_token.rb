class AuthenticationToken < ApplicationRecord
  belongs_to :user
  has_secure_token :body
end
