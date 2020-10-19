class SessionsController < ApplicationController 
    
    def index
    end

    def new
        if logged_in?
            redirect_to root_path 
            flash[:message] = "Already Logged In!"
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
            render :new 
            flash[:message] = "Invalid Login"
        end 
    end 

    def delete
        session.clear
        redirect_to root_path
    end 

end 
