class SessionSerializer < ActiveModel::Serializer
  attributes :auth_token
  type 'session'
end
