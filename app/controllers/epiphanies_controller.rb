require 'pry'
class EpiphaniesController < ApplicationController

    get '/epiphanies' do 
        if logged_in?
            @session = session[:user_id]
            erb :'/epiphanies/epiphanies'
        else
            redirect to '/login'
        end 
    end 

    get '/epiphanies/new' do 
        if !logged_in?
            redirect to '/login'
        else 
            @session = session[:user_id]
            erb :'/epiphanies/new'
        end 
    end  

    post '/epiphanies' do 
        if !params[:content].empty?
            @epiphanies = Epiphany.create(content: params[:content], user_id: session[:user_id])
            erb :'/epiphanies/epiphanies'
        else 
            redirect to '/epiphanies/new'
        end 
    end 

    get '/epiphanies/:id' do 
        if !logged_in?
            redirect to '/login'
        else 
            @epiphanies = current_user.epiphanies
            erb :'/epiphanies/show'
        end 
    end 

    get '/epiphanies/:id/edit' do 
        if !logged_in? 
            redirect to '/login'
        else 
            @epiphanies = Epiphany.find_by(id: params[:id])
            if @epiphanies.user_id == current_user.id
                erb :'/epiphanies/edit'
            else 
                redirect to '/epiphanies/show'
            end 
        end 
    end 
    
    patch '/epiphanies/:id' do 
        if params[:content].empty?
            redirect to "/epiphanies/#{params[:id]}/edit"
        end 
        @epiphanies = Epiphany.find_by(id: params[:id])
        @epiphanies.update(content: params[:content])
        @epiphanies.save
        redirect to "/epiphanies/#{@epiphanies.id}"
    end 

    get '/epiphanies/:id/delete' do 
        @epiphanies = Epiphany.find_by(id: params[:id])
        if current_user.id != @epiphanies.user_id
            redirect to '/epiphanies'
        else 
            @epiphanies.delete
            redirect to '/epiphanies'
        end 
    end 

end 