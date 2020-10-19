class SessionsController < ApplicationController 
    
    def index
    end

    def new
        if logged_in?
            flash[:message] = "Already Logged In!"
            redirect_to root_path 
        else 
            @user = User.new
        end
    end 

    def library 
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])
        
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to root_path
        else
            flash[:message] = "Invalid Login"
            render :new 
        end 
    end 

    def delete
        session.clear
        redirect_to root_path
    end 

end 
