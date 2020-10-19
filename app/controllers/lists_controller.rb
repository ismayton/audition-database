class ListsController < ApplicationController
    include ListsHelper
    
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @lists = @user.lists
        elsif params[:instrument_id]
            @instrument = Instrument.find(params[:instrument_id])
            @lists = @instrument.lists 
        else
            @lists = List.all  
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
        @list.update(list_params)
        if !@list.valid?
            render :edit
            flash[:message] = "Date is Required"
        elsif !params[:list][:user_ids].empty?
            redirect_to user_lists_path(user)
        else
            redirect_to list_path(@list)
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
