class ApplicationController < ActionController::Base
    include ApplicationHelper

    before_action :current_user, :current_admin

    def clear_errors
        flash.clear 
    end 

    private 

    def current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        else
            @current_user = false
        end
    end

    def current_admin
        if @current_user && @current_user.admin
            @current_admin = @current_user
        else
            @current_admin = false
        end
    end
end
