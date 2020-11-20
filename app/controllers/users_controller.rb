class UsersController < ApplicationController
#stateless - handles each site individually
# session = hash, always available, persited into a cookie, sent back to server.

  # before do
  #   require_login
  # end

  get '/users/signup' do #new
    if logged_in
      "You're already logged in!"
     else
       erb :'sessions/signup'
     end
  end

  post '/users/signup' do
      if params[:username] == "" && params[:password] == ""
        redirect to "/users/signup"
      else
      @user = User.new(params)
      session[:user_id] = @user.id #setting session key to a value
      redirect to "/users/#{@user.id}"
    end
  end

  get '/users/login' do
    if !logged_in?
    erb :'users/login'
    else
      #flash message - welcome back
      erb :'/users/drinkbook'
    end
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username]) #more specific search than .find
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
