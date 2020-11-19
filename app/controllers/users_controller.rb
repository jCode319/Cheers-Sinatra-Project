class UsersController < ApplicationController

  # before do
  #   require_login
  # end
  get '/users/signup' do #new
    erb :'sessions/signup'
  end

  post '/users/signup' do
    @user = User.create(params)
    # if @user.save
    #   session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    # else
    #   "error message"     #come back and do flash message
    #   redirect to '/sessions/signup'
    # end
  end

  get '/users/:id' do
    @user = User.find(params[:id])

    erb :'/users/drinkbook'
  end

  # get '/:id' do
  #        @user = User.find_by(username: params[:id])
  #        # @recipes = Recipe.all.select { |r| r.user_id == @user.id }
  #        # @recipes = @recipes.sort_by{|r| r.name}
  #        erb :"users/show"
  #      end
end
