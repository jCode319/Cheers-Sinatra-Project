class SessionsController < ApplicationController

  get '/sessions/signup' do #new
    erb :'sessions/signup'
  end

  post '/sessions/signup' do
    user = User.create(params)
    if user.save
      session[:user_id] = user.id
      redirect to '/recipes'
    else
      "error message"     #come back and do flash message
      redirect to '/sessions/signup'
    end
  end

  get '/sessions/login' do
    if !logged_in?
    erb :'sessions/login'
    else
    redirect to '/recipes'
    end
  end

  post '/sessions/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[user_id] = user_id
      redirect to '/recipes'
    else
      #come back to make a flash message.
      "Sorry, that is incorrect, please try again or click Sign Up below to create a new account."
      redirect to '/sessions/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end

end
