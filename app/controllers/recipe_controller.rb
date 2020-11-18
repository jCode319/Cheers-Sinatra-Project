class RecipesController < ApplicationController

  # before do
  #   require_login
  # end

  get '/recipes' do #read
    @recipes = Recipe.all
    @sorted_recipes = @recipes.sort_by {|r| r.name}
    erb :'/recipes/index'
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do #create
    "You've been made"
    @recipe = Recipe.create(params)
    # @recipe.user_id = current_user.id
     # binding.pry

  end

  get '/recipes/:id' do
    @recipes = Recipe.find_by(id: params[:id])
      # if @recipe
        # @user = User.find(@recipe.user_id)
        erb :'/recipes/show'
      # else
      #   redirect to '/recipes'
      # end
  end

  get '/recipes/:id/edit' do
    erb :'recipes/edit'
  end

  # helpers do
  #   def item_params
  #     params.require(:recipe).permit(:name, :ingredients, :descriptions, :spirit_type)
  #   end
  # end
  # this is to make fields required...maybe

end
