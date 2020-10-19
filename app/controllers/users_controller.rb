class UsersController < ApplicationController 

    def new
        if logged_in?
            redirect_to root_path
            flash[:message] = "Already Logged In!"
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

    def edit 
        binding.pry
    end 

 
end 
