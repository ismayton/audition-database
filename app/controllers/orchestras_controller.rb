class OrchestrasController < ApplicationController
    include OrchestrasHelper
    
    def index 
        @orchestras = Orchestra.with_lists
    end 

    def show
        @orchestra = Orchestra.find(params[:id])
    end   
    
    def new 
        if @current_admin
            @orchestra = Orchestra.new
        else
            flash[:message] = "Admin Access Only"
            redirect_to orchestras_path
        end
    end 

    def create 
        @orchestra = Orchestra.create(orchestra_params)
        @orchestra.positions = Position.all
        redirect_to orchestra_path(@orchestra)
    end 

    def edit
        if @current_admin
            @orchestra = Orchestra.find(params[:id])
        else
            flash[:message] = "Admin Access Only"
            redirect_to orchestra_path(params[:id])
        end 
    end 

    def update 
        @orchestra = Orchestra.find(params[:id])
        if !params[:orchestra][:name].empty?
            @orchestra.update(orchestra_params)
            redirect_to orchestra_path(@orchestra)
        else
            flash[:message] = "Name is Required"
            render :edit
        end 
    end 

    def destroy
        if @current_admin
            @orchestra = Orchestra.find(params[:id])
            @orchestra.lists.each do |list| 
                list.destroy 
            end
            @orchestra.destroy

            redirect_to orchestras_path
        else
            flash[:message] = "Admin Access Only"
            redirect_to orchestra_path(params[:id])
        end
    end

end
