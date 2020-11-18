class SessionsController < Sinatra::Base

  get '/signup' do #new
    erb :'/sessions/signup'
  end

  # get '/signup' do
  #   if !logged_in?
  #     erb :"sessions/signup"
  #   else
  #     redirect "/"
  #   end
  # end



end
