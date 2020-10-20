module UsersHelper

    def login_or_signup_path
        if current_page? login_path 
            return true 
        elsif current_page? signup_path 
            return true 
        else 
            return false 
        end
    end 

    def username
        @current_user.username
    end

    def user_lists
        if @current_user
            @current_user.lists
        else
            false
        end 
    end 

    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :admin)
    end 
end
