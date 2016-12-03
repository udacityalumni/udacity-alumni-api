class User < ApplicationRecord
  before_create :generate_auth_token!

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  enum role: [:user, :author, :admin]

  before_save { self.email = email.downcase }
  after_initialize :set_default_role
  after_create :send_welcome_email

  validates :auth_token, uniqueness: true
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  # Admin User will have => many spotlight images
  has_many :spotlight_images
  has_many :feedbacks
  alias_attribute :feedback, :feedbacks

  has_many :authentication_tokens

  def generate_auth_token!
    self.authentication_tokens << AuthenticationToken.create(body: Devise.friendly_token)
  end

  private

  def set_default_role
    self.role ||= :user if self.new_record?
  end

  def send_welcome_email
    NewUserSignupMailer.welcome_email(self).deliver_now
  end
end
