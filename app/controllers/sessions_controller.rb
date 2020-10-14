class SessionsController < ApplicationController 

    def index
    end

    def signup
        @user = User.new
    end 

    def login

    end 

end 
