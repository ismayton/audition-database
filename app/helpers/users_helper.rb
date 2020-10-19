module UsersHelper
    
    def logged_in?
        if session[:user_id] && !!User.find_by(id: session[:user_id])
            return true 
        else
            return false 
        end 
    end

    def admin?
        if logged_in?
            User.find(session[:user_id]).admin 
        else
            false 
        end
    end 

    def login_or_signup_path
        if current_page? login_path 
            return true 
        elsif current_page? signup_path 
            return true 
        else 
            return false 
        end
    end 

    def user 
        User.find(session[:user_id])
    end 

    def username
        User.find(session[:user_id]).username
    end

    def user_lists
        User.find(session[:user_id]).lists 
    end 

    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :admin)
    end 
end
