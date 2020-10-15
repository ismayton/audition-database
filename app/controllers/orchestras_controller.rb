class OrchestrasController < ApplicationController
    include OrchestrasHelper
    
    def index 
        @orchestras = orchestras_with_lists
    end 

    def show
        @orchestra = Orchestra.find(params[:id])
    end   
    
    def new 
        if admin?
            @orchestra = Orchestra.new
        else
            redirect_to orchestras_path
            flash[:message] = "Admin Access Only"
        end
    end 

    def create 
        @orchestra = Orchestra.create(orchestra_params)
        @orchestra.positions = Position.all
        redirect_to orchestra_path(@orchestra)
    end 

    def edit
        if admin?
            @orchestra = Orchestra.find(params[:id])
        else
            redirect_to orchestra_path(params[:id])
            flash[:message] = "Admin Access Only"
        end 
    end 

    def update 
        @orchestra = Orchestra.find(params[:id])
        if !params[:orchestra][:name].empty?
            @orchestra.update(orchestra_params)
            redirect_to orchestra_path(@orchestra)
        else
            render :edit
            flash[:message] = "Name is Required" 
        end 
    end 

    def destroy
        if admin?
            @orchestra = Orchestra.find(params[:id])
            @orchestra.lists.each do |list| 
                list.destroy 
            end
            @orchestra.destroy

            redirect_to orchestras_path
        else
            redirect_to orchestra_path(params[:id])
            flash[:message] = "Admin Access Only"
        end
    end

end
