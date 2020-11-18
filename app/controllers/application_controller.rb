require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :homepage
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
  end

end
