class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes

  validates :username, :password_digest, :email, presence: true
  validates :email, uniqueness: true
end
