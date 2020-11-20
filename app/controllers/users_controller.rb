class UsersController < ApplicationController
#stateless - handles each site individually
# session = hash, always available, persited into a cookie, sent back to server.

  # before do
  #   require_login
  # end

  get '/users/signup' do #new
    erb :'sessions/signup'
  end

  post '/users/signup' do
      @user = User.create(params)
      session[:user_id] = @user.id #setting session key to a value
      redirect to "/users/#{@user.id}"
    # if
    #else
    #   "error message"     #come back and do flash message
    #   redirect to '/sessions/signup'
    # end
  end

  get '/users/login' do
    if !logged_in?
    erb :'sessions/login'
    else
    redirect to "/users/#{@user.id}"
    end
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username]) #more specific than .find

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user_id
      redirect to "/users/#{@user.id}"
    else
      #come back to make a flash message.
      "Sorry, that is incorrect, please try again or click Sign Up below to create a new account."
      redirect to '/users/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/drinkbook'
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end


end
