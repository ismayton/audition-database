class ComposersController < ApplicationController
    include ComposersHelper
    
    def index 
        @composers = Composer.all
    end

    def show
        @composer = Composer.find(params[:id])
    end
    
    def new 
        if admin?
            @composer = Composer.new
        else
            redirect_to composers_path
            flash[:message] = "Admin Access Only"
        end
    end 

    def create 
        @composer = Composer.create(composer_params)
        redirect_to composer_path(@composer)
    end 

    def edit
        if admin?
            @composer = Composer.find(params[:id])
        else
            redirect_to composer_path(params[:id])
            flash[:message] = "Admin Access Only"
        end 
    end 

    def update 
        @composer = Composer.find(params[:id])
        if !params[:composer][:name].empty?
            @composer.update(composer_params)
            redirect_to composer_path(@composer)
        else
            render :edit
            flash[:message] = "Date is Required" 
        end 
    end 

    def destroy
        if admin?
            Composer.find(params[:id]).destroy
            redirect_to composers_path
        else
            redirect_to composer_path(params[:id])
            flash[:message] = "Admin Access Only"
        end
    end
end
