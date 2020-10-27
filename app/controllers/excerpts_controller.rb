class ExcerptsController < ApplicationController
    include ExcerptsHelper

    def index
        if params[:list_id]
            @excerpts = List.find(params[:list_id]).excerpts
        else
            @excerpts = Excerpt.all
        end
    end 

    def show 
        @excerpt = Excerpt.find(params[:id])
    end

    def new 
        if @current_admin
            @excerpt = Excerpt.new(list_ids: params[:list_id])
            @lists = List.all
        else
            flash[:message] = "Admin Access Only"
            redirect_to excerpts_path
        end
    end 

    def create 
        @excerpt = Excerpt.new(excerpt_params)
        @excerpt.save
        if !@excerpt.valid?
            flash.now[:message] = "Invalid Excerpt"
            render :new
        elsif !params[:excerpt][:list_ids].empty?
            redirect_to list_path(List.find(params[:excerpt][:list_ids]))
        else
            redirect_to excerpt_path(@excerpt)
        end
    end 

    def edit
        if @current_admin
            @excerpt = Excerpt.find(params[:id])
        else
            flash[:message] = "Admin Access Only"
            redirect_to excerpt_path(params[:id])
        end 
    end 

    def update 
        @excerpt = Excerpt.find(params[:id])
        if !params[:excerpt][:description].empty?
            @excerpt.update(excerpt_params)
            redirect_to excerpt_path(@excerpt)
        else
            flash[:message] = "Description is Required"
            render :edit
        end 
    end 

    def destroy
        if @current_admin
            @excerpt = Excerpt.find(params[:id])
            @excerpt.destroy
            redirect_to excerpts_path
        else
            flash[:message] = "Admin Access Only"
            redirect_to excerpt_path(params[:id])
        end
    end

    private 

    def excerpt_params
        params.require(:excerpt).permit(:description, :piece_id, :list_ids)
    end
end
