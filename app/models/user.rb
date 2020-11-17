class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes through: :saved_recipes
end
