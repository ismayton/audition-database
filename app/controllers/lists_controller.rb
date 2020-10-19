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
            flash[:message] = "Admin Access Only"
            redirect_to lists_path
        end
    end 

    def create 
        @list = List.new(list_params)
        if @list.save
            redirect_to list_path(@list)
        else
            flash[:message] = "Invalid List Params"
            render 'new'
        end
    end 

    def edit
        if admin?
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
            flash[:message] = "Date is Required"
            render :edit
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
            flash[:message] = "Admin Access Only"
            redirect_to list_path(params[:id])
        end
    end

end
