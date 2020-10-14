module UsersHelper
    
    def logged_in?
        !!session[:user_id]
    end
  
    def user_params
        params.require(:user).permit(:username, :email, :password, :admin)
    end 
    
end
