require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, Proc.new { File.join(root, "static") }
    set :views, Proc.new { File.join(root, "templates") }
    enable :sessions
    use Rack::Flash, :sweep => true
    set :session_secret, "secret_secret"
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

    def requie_login
      unless logged_in?
        redirect '/login'
      end
    end
  end

end
