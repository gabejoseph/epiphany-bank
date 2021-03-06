require 'pry'
class UsersController < ApplicationController

    get '/signup' do 
        if logged_in?
            redirect to '/epiphanies'
        else 
            erb :'/users/signup'
        end 
    end 

    post '/signup' do
        params.each do |label, input|
            if input.empty?
                redirect to "/signup"
            end 
        end 
        @user = User.create(name: params[:name], email: params[:email], password: params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect to "/epiphanies"
    end 

    get '/login' do  
        if logged_in? 
            redirect to '/epiphanies'
        else 
            erb :'/users/login'
        end 
    end 

    post '/login' do 
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/epiphanies'
        else 
            redirect to '/login'
        end 
    end 

    # get '/users/:slug' do 
    #     slug = params[:slug]
    #     @user = User.find_by(username: slug)
    #     erb :'/users/show'
    # end 

    get '/logout' do
        if logged_in?
          session.clear
          redirect to '/login'
        else
          redirect to '/'
        end
    end

end 