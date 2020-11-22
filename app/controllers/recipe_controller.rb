class RecipesController < ApplicationController

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

#update

  get '/recipes/:id/edit' do
    @recipes = Recipe.find(params[:id])
    erb :'recipes/edit'
  end

  patch '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    # if authorized_to_edit(@recipes)
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
