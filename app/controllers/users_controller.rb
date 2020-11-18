class UsersController < ApplicationController

  # before do
  #   require_login
  # end

  get '/users' do
    @user = User.create(params)
    binding.pry
  end

  get '/:id' do
         @user = User.find_by(username: params[:id])
         # @recipes = Recipe.all.select { |r| r.user_id == @user.id }
         # @recipes = @recipes.sort_by{|r| r.name}
         erb :"users/show"
       end
end
