class RecipesController < ApplicationController

  # before do
  #   require_login
  # end

#create
  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do
    @recipes = Recipe.create(
      name: params[:name],
      ingredients: params[:ingredients],
      directions: params[:directions],
      spirit_type: params[:spirit_type]
    )
      redirect to "/recipes/#{@recipes.id}"
  end

#read
  get '/recipes' do
    @recipes = Recipe.all
    @sorted_recipes = @recipes.sort_by {|r| r.name}
    erb :'/recipes/index'
  end

  get '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    # binding.pry
        erb :'/recipes/show'
      # else
      #   redirect to '/recipes'
      # end
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    # @user = User.find(recipe.user_id)
    erb :'recipes/edit'
  end

  patch '/recipes' do

  end

  # helpers do
  #   def item_params
  #     params.require(:recipe).permit(:name, :ingredients, :descriptions, :spirit_type)
  #   end
  # end
  # this is to make fields required...maybe

end
