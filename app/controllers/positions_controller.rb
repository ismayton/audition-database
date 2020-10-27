class PositionsController < ApplicationController
    include PositionsHelper
    
    def index 
        @positions = Position.with_lists
    end

    def show
        @position = Position.find(params[:id])
    end

    def new 
        if @current_admin
            @position = Position.new
        else
            flash[:message] = "Admin Access Only"
            redirect_to positions_path 
        end
    end 

    def create 
        @position = Position.new(position_params)
        
        if @position.save
            Orchestra.all.each do |orchestra|
                orchestra.positions << @position 
            end
            redirect_to position_path(@position)
        else
            flash.now[:message] = "Failed to create position"
            render 'new'
        end
    end 

    def edit
        if @current_admin
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
            flash.now[:message] = "Title is Required"
            render :edit
        end 
    end 

    def destroy
        if @current_admin
            @position = Position.find(params[:id]).destroy
            redirect_to positions_path
        else
            flash[:message] = "Admin Access Only"
            redirect_to position_path(params[:id])
        end
    end
    
    private 
    
    def position_params
        params.require(:position).permit(:title)
    end
end
