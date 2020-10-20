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
        if admin?
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
        if params[:excerpt][:list_ids]
            redirect_to list_path(List.find(params[:excerpt][:list_ids]))
        else
            redirect_to excerpt_path(@excerpt)
        end
    end 

    def edit
        if admin?
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
        if admin?
            @excerpt = Excerpt.find(params[:id])
            @excerpt.destroy

            redirect_to excerpts_path
        else
            flash[:message] = "Admin Access Only"
            redirect_to excerpt_path(params[:id])
        end
    end
end
