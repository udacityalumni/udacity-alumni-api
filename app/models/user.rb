class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  enum role: [ :user, :author, :admin ]

  after_initialize :set_default_role

  private

  def set_default_role
    self.role ||= :user if self.new_record?
  end
end
