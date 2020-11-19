class Recipe < ActiveRecord::Base
  belongs_to :user
  # has_many :saved_recipes
  # has_many :users, through: :saved_recipes
end
