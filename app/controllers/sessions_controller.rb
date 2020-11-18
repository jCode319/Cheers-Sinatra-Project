class SessionsController < Sinatra::Base


  get '/sessions/signup' do
    # if !logged_in?
      erb :'sessions/signup'
    # else
    #   redirect "/drink"
    end
  # end



end
