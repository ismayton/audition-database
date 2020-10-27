class PiecesController < ApplicationController 
    include PiecesHelper

    def index
        @pieces = Piece.all
    end 

    def show 
        @piece = Piece.find(params[:id])
    end

    def new 
        if @current_admin
            @piece = Piece.new
        else
            flash[:message] = "Admin Access Only"
            redirect_to pieces_path
        end
    end 

    def create 
        @piece = Piece.new(piece_params)

        if !params[:piece][:composer].empty?
            @piece.composer = Composer.find_or_create_by(name: params[:piece][:composer]) 
        end 

        if @piece.save
            redirect_to piece_path(@piece)
        else
            
            flash.now[:message] = "Invalid Piece Params"
            render 'new'
        end
    end 

    def edit
        if @current_admin
            @piece = Piece.find(params[:id])
        else
            flash[:message] = "Admin Access Only"
            redirect_to piece_path(params[:id])
        end 
    end 

    def update 
        @piece = Piece.find(params[:id])
        if @piece.update(piece_params)
            redirect_to piece_path(@piece)
        elsif params[:piece][:title].empty?
            flash.now[:message] = "Title is Required"
            render :edit
        else
            flash.now[:message] = "Composer is Required"
            render :edit
        end
    end 

    def destroy
        if @current_admin
            @piece = Piece.find(params[:id])
            @piece.excerpts.each do |excerpt|
                excerpt.destroy 
            end 
            @piece.destroy

            redirect_to pieces_path
        else
            flash[:message] = "Admin Access Only"
            redirect_to piece_path(params[:id])
        end
    end
    
    private
    
    def piece_params
        params.require(:piece).permit(:title, :composer_id)
    end
end 
