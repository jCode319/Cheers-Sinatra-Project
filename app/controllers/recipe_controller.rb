class RecipesController < ApplicationController

  # before do
  #   require_login
  # end

  get '/recipes' do
    @recipes = Recipe.all
    @sorted_recipes = @recipes.sort_by {|r| r.name}
    erb :'/recipes/index'
  end

  get '/recipes/:id' do
    erb :'/recipes/show'
  end

end
