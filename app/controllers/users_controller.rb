require 'pry'
class UsersController < ApplicationController

    get '/login' do  
        erb :'/users/login'
    end 

    post '/login' do 


        @user = User.create(name: params[:name], email: params[:email], password: params[:password])
        @user.save
        binding.pry
        redirect to '/epiphanies'
    end 

    get '/signup' do 
        erb :'/users/signup'
    end 

    post '/signup' do

    end 

end 