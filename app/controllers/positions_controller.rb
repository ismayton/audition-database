class PositionsController < ApplicationController
    include PositionsHelper
    
    def index 
        @positions = positions_with_lists
    end

    def show
        @position = Position.find(params[:id])
    end

    def new 
        if admin?
            @position = Position.new
        else
            redirect_to positions_path
            flash[:message] = "Admin Access Only"
        end
    end 

    def create 
        @position = Position.create(position_params)
        Orchestra.all.each do |orchestra|
            orchestra.positions << @position 
        end 

        redirect_to position_path(@position)
    end 

    def edit
        if admin?
            @position = Position.find(params[:id])
        else
            redirect_to position_path(params[:id])
            flash[:message] = "Admin Access Only"
        end 
    end 

    def update 
        @position = Position.find(params[:id])
        if !params[:position][:title].empty?
            @position.update(position_params)
            redirect_to position_path(@position)
        else
            render :edit
            flash[:message] = "Title is Required" 
        end 
    end 

    def destroy
        if admin?
            @position = Position.find(params[:id]).destroy
            redirect_to positions_path
        else
            redirect_to position_path(params[:id])
            flash[:message] = "Admin Access Only"
        end
    end
    
end
