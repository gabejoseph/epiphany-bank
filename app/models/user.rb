require 'pry'
class User < ActiveRecord::Base
    has_many :epiphanies
    has_secure_password






end 