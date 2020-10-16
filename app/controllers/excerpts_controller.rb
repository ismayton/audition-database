class ExcerptsController < ApplicationController
    include ExcerptsHelper

    def index
        @excerpts = Excerpt.all
    end 

    def show 
        @excerpt = Excerpt.find(params[:id])
    end

    def new 
        if admin?
            @excerpt = Excerpt.new
            @lists = List.all
        else
            redirect_to excerpts_path
            flash[:message] = "Admin Access Only"
        end
    end 

    def create 
        @excerpt = Excerpt.new(excerpt_params)

        if !params[:excerpt][:composer].empty?
            @excerpt.composer = Composer.find_or_create_by(name: params[:excerpt][:composer]) 
        end 

        @excerpt.save
        redirect_to excerpt_path(@excerpt)
    end 

    def edit
        if admin?
            @excerpt = Excerpt.find(params[:id])
        else
            redirect_to excerpt_path(params[:id])
            flash[:message] = "Admin Access Only"
        end 
    end 

    def update 
        @excerpt = Excerpt.find(params[:id])
        if !params[:excerpt][:title].empty?
            @excerpt.update(excerpt_params)
            @excerpt.composer = Composer.find_or_create_by(name: params[:excerpt][:composer])
            redirect_to excerpt_path(@excerpt)
        else
            render :edit
            flash[:message] = "Date is Required" 
        end 
    end 

    def destroy
        if admin?
            @excerpt = Excerpt.find(params[:id])
            @excerpt.destroy

            redirect_to excerpts_path
        else
            redirect_to excerpt_path(params[:id])
            flash[:message] = "Admin Access Only"
        end
    end
end
