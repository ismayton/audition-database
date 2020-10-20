class ListsController < ApplicationController
    include ListsHelper
    
    def index
        if params[:user_id]
            @lists = @current_user.lists
        elsif params[:instrument_id]
            @lists = Instrument.find(params[:instrument_id]).lists
        else
            @lists = List.all  
        end
    end

    def show 
        @list = List.find(params[:id])
    end 

    def new 
        if @current_admin
            @list = List.new(user_ids: params[:user_id])
        else
            flash[:message] = "Admin Access Only"
            redirect_to lists_path
        end
    end 

    def create 
        @list = List.new(list_params)
        @list.save
        if !@list.valid?
            flash.now[:message] = "Invalid List Params"
            render 'new'
        elsif params[:list][:user_ids]
            redirect_to user_lists_path(@current_user)
        else
            redirect_to list_path(@list)            
        end
    end 

    def edit
        if @current_admin
            @list = List.find(params[:id])
        else
            flash[:message] = "Admin Access Only"
            redirect_to list_path(params[:id])
        end 
    end 

    def update 
        @list = List.find(params[:id])
        @list.update(list_params)
        if !@list.valid?
            flash.now[:message] = "Date is Required"
            render :edit
        elsif !params[:list][:user_ids].empty?
            redirect_to user_lists_path(@current_user)
        else
            redirect_to list_path(@list)
        end 
    end 

    def destroy
        if @current_admin
            @list = List.find(params[:id])
            @list.destroy

            redirect_to lists_path
        else
            flash[:message] = "Admin Access Only"
            redirect_to list_path(params[:id])
        end
    end

end
