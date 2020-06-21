require 'pry'
class EpiphaniesController < ApplicationController

    get '/epiphanies' do 
        binding.pry
        @epiphanies = Epiphany.all
        @user = self.current_user
        erb :'/epiphanies/epiphanies'
    end 






end 