class UsersController < ApplicationController 
    def new
        if @current_user
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
            render :new
        end
    end  

    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :admin)
    end
end 
