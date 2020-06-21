require 'pry'
class EpiphaniesController < ApplicationController

    get '/epiphanies' do 
        if !logged_in?
            binding.pry
            redirect to '/login'
        else
            binding.pry
            @epiphanies = Epiphany.all
            @user = self.current_user
            erb :'/epiphanies/epiphanies'
        end 
    end 






end 