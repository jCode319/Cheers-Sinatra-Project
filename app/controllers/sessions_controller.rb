class SessionsController < ApplicationController

  # get '/sessions/login' do
  #   if !logged_in?
  #   erb :'sessions/login'
  #   else
  #   redirect to "/users/#{@user.id}"
  #   end
  # end
  #
  # post '/sessions/login' do
  #   @user = User.find_by(username: params[:username])
  #
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user_id
  #     redirect to "/users/#{@user.id}"
  #   else
  #     #come back to make a flash message.
  #     "Sorry, that is incorrect, please try again or click Sign Up below to create a new account."
  #     redirect to '/sessions/login'
  #   end
  # end
  #
  # get '/logout' do
  #   session.destroy
  #   redirect '/'
  # end

end
