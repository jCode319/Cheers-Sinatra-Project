class Recipe < ActiveRecord::Base
  has_many :recipes through: :saved_recipes
end
