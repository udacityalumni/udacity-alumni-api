class SpotlightImage < ApplicationRecord
    #before_create :generate_auth_token!
    validates :url, presence: true
    # Each spotlight_image will belong to a user
    belongs_to :user
    

    # def generate_auth_token!
    #     self.auth_token = Devise.friendly_token
    # end
end
