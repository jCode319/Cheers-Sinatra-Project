class SessionsController < ApplicationController

  get '/sessions/signup' do #new
    erb :'sessions/signup'
  end

  post '/sessions/signup' do
    user = User.create(params)
    redirect to '/recipe'
  end

  # get '/signup' do
  #   if !logged_in?
  #     erb :"sessions/signup"
  #   else
  #     redirect "/"
  #   end
  # end



end
