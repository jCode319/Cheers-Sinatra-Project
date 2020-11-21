require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "sedricnkretup" #set-up encryption so it doesn't get hacked easily
  end

  get "/" do
    erb :homepage
  end

  get '/test' do
    if !!session[:user_id]
      "You are logged in"
    else
      "you are not logged in"
    end
  end

helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def require_login
      unless logged_in?
        redirect '/login'
      end
    end

    def authorized_to_edit(recipe)
      recipe.user_id == session[:user_id]
    end

  end

end
