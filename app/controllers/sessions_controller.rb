class SessionsController < ApplicationController 
    
    def index
    end

    def new
        if @current_user
            flash[:message] = "Already Logged In!"
            redirect_to root_path 
        else 
            @user = User.new
        end
    end 

    def library 
    end
    
    def create
        if auth
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.username = auth['info']['name']
                u.email = auth['info']['email']
                u.password = SecureRandom.hex(9)
            end
        
            session[:user_id] = @user.id 
            redirect_to root_path 
        elsif @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to root_path
        else
            flash.now[:message] = "Invalid Login"
            render :new 
        end 
    end 

    def delete
        session.clear
        redirect_to root_path
    end 

    private 

    def auth
        request.env['omniauth.auth']
    end 

end 
