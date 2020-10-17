class PiecesController < ApplicationController 
    include PiecesHelper

    def index
        @pieces = Piece.all
    end 

    def show 
        @piece = Piece.find(params[:id])
    end

    def new 
        if admin?
            @piece = Piece.new
        else
            redirect_to pieces_path
            flash[:message] = "Admin Access Only"
        end
    end 

    def create 
        @piece = Piece.new(piece_params)

        if !params[:piece][:composer].empty?
            @piece.composer = Composer.find_or_create_by(name: params[:piece][:composer]) 
        end 

        @piece.save
        redirect_to piece_path(@piece)
    end 

    def edit
        if admin?
            @piece = Piece.find(params[:id])
        else
            redirect_to piece_path(params[:id])
            flash[:message] = "Admin Access Only"
        end 
    end 

    def update 
        @piece = Piece.find(params[:id])
        if !params[:piece][:title].empty?
            @piece.update(piece_params)
            if !params[:piece][:composer].empty?
                @piece.composer = Composer.find_or_create_by(name: params[:piece][:composer]) 
                @piece.save
            end 
            redirect_to piece_path(@piece)
        else
            render :edit
            flash[:message] = "Title is Required" 
        end 
    end 

    def destroy
        if admin?
            @piece = Piece.find(params[:id])
            @piece.excerpts.each do |excerpt|
                excerpt.destroy 
            end 
            @piece.destroy

            redirect_to pieces_path
        else
            redirect_to piece_path(params[:id])
            flash[:message] = "Admin Access Only"
        end
    end
    
end 
