class User < ActiveRecord::Base
  has_secure_password
  # has_many :saved_recipes
  has_many :recipes
end
