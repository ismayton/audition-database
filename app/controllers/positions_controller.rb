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
            flash[:message] = "Admin Access Only"
            redirect_to positions_path
        end
    end 

    def create 
        @position = Position.new(position_params)
        Orchestra.all.each do |orchestra|
            orchestra.positions << @position 
        end
        if @position.save
            redirect_to position_path(@position)
        else
            flash[:message] = "Failed to create position"
        end
    end 

    def edit
        if admin?
            @position = Position.find(params[:id])
        else
            flash[:message] = "Admin Access Only"
            redirect_to position_path(params[:id])
        end 
    end 

    def update 
        @position = Position.find(params[:id])
        if !params[:position][:title].empty?
            @position.update(position_params)
            redirect_to position_path(@position)
        else
            flash[:message] = "Title is Required"
            render :edit
        end 
    end 

    def destroy
        if admin?
            @position = Position.find(params[:id]).destroy
            redirect_to positions_path
        else
            flash[:message] = "Admin Access Only"
            redirect_to position_path(params[:id])
        end
    end
    
end
