class SavedRecipe < ActiveRecord::Base
  belongs_to :users
  belongs_to :recipes 
end
