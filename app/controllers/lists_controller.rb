class ListsController < ApplicationController
    include ListsHelper
    
    def index
        @lists = List.all 
    end

    def show 
        @list = List.find(params[:id])
    end 

    def new 
        if admin?
            @list = List.new
        else
            redirect_to lists_path
            flash[:message] = "Admin Access Only"
        end
    end 

    def create 
        @list = List.create(list_params)
        redirect_to list_path(@list)
    end 

    def edit
        if admin?
            @list = List.find(params[:id])
        else
            redirect_to list_path(params[:id])
            flash[:message] = "Admin Access Only"
        end 
    end 

    def update 
        @list = List.find(params[:id])
        if !params[:list][:date].empty?
            @list.update(list_params)
            redirect_to list_path(@list)
        else
            render :edit
            flash[:message] = "Date is Required" 
        end 
    end 

    def destroy
        if admin?
            @list = List.find(params[:id])
            @list.destroy

            redirect_to lists_path
        else
            redirect_to list_path(params[:id])
            flash[:message] = "Admin Access Only"
        end
    end


end
