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
      spirit_type: params[:spirit_type],
      user_id: current_user.id
      )
      redirect "/recipes/#{@recipes.id}"
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


  get '/recipes/:id/edit' do
    @recipes = Recipe.find(params[:id])
    erb :'recipes/edit'
  end

  #update

  patch '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    @recipes.update(
        name: params[:name],
        ingredients: params[:ingredients],
        directions: params[:directions],
        spirit_type: params[:spirit_type],
        )
    redirect "/recipes/#{@recipes.id}"
  end

  #delete
  delete '/recipes/:id' do
    recipes = Recipe.find(params[:id])
    recipes.destroy
    redirect to '/recipes'
  end




end





  # helpers do
  #   def item_params
  #     params.require(:recipe).permit(:name, :ingredients, :descriptions, :spirit_type)
  #   end
  # end
  # this is to make fields required...maybe
