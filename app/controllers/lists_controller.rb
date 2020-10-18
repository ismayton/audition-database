class ListsController < ApplicationController
    include ListsHelper
    
    def index
        @lists = List.all 
        if params[:user_id]
            @user = User.find(params[:user_id])
        end

    end

    def show 
        @list = List.find(params[:id])
    end 

    def new 
        if admin?
            @list = List.new
            @list.excerpts.build
        else
            redirect_to lists_path
            flash[:message] = "Admin Access Only"
        end
    end 

    def create 
        @list = List.new(list_params)
        if @list.save
            redirect_to list_path(@list)
        else
            render 'new'
            flash[:message] = "Invalid List Params"
        end
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
