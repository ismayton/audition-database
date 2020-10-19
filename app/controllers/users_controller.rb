class UsersController < ApplicationController 

    def new
        if logged_in?
            flash[:message] = "Already Logged In!"
            redirect_to root_path
        else    
            @user = User.new
        end
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            render '/signup'
        end
    end  
end 
