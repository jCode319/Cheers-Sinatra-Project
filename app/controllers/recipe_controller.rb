class RecipesController < ApplicationController

  # before do
  #   require_login
  # end

#create
  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do
    @recipe = Recipe.create(
      name: params[:name],
      ingredients: params[:ingredients],
      directions: params[:directions],
      spirit_type: params[:spirit_type],
      user_id: current_user.id
      )
      redirect "/recipes/#{@recipe.id}"
  end

#read
  get '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
      erb :'recipes/show'
  end

  get '/recipes' do
    @recipes = Recipe.all
    @sorted_recipes = @recipes.sort_by {|r| r.name}
    erb :'recipes/index'
  end

#update

  get '/recipes/:id/edit' do
    binding.pry
    # @recipes = Recipe.find(params[:id])
    erb :'recipes/edit'
  end

  patch '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    @recipes.update(
        name: params[:name],
        ingredients: params[:ingredients],
        directions: params[:directions],
        spirit_type: params[:spirit_type],
        user_id: current_user.id
        )
    erb :'recipes/show'
  end

  #delete





end





  # helpers do
  #   def item_params
  #     params.require(:recipe).permit(:name, :ingredients, :descriptions, :spirit_type)
  #   end
  # end
  # this is to make fields required...maybe
