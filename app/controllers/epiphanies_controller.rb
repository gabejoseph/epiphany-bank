require 'pry'
class EpiphaniesController < ApplicationController

    get '/epiphanies' do 
        if logged_in?
            @epiphanies = Epiphany.all
            @user = self.current_user
            binding.pry
            erb :'/epiphanies/epiphanies'
        else
            redirect to '/login'
        end 
    end 






end 