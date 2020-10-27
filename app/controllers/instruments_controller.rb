class InstrumentsController < ApplicationController 
    include InstrumentsHelper

    def index 
        @instruments = Instrument.with_lists
    end

    def show
        @instrument = Instrument.find(params[:id])
    end

    def new 
        if @current_admin
            @instrument = Instrument.new
        else
            flash[:message] = "Admin Access Only"
            redirect_to instruments_path
        end
    end 

    def create 
        @instrument = Instrument.new(instrument_params)

        if @instrument.save
            redirect_to instrument_path(@instrument)
        else
            flash.now[:message] = "Invalid Instrument Params"
            render :new 
        end 
    end 

    def edit
        if @current_admin
            @instrument = Instrument.find(params[:id])
        else
            flash[:message] = "Admin Access Only"
            redirect_to instrument_path(params[:id])
        end 
    end 

    def update 
        @instrument = Instrument.find(params[:id])
        if @instrument.update(instrument_params)
            redirect_to instrument_path(@instrument)
        else
            flash.now[:message] = "Name is Required"
            render :edit
        end 
    end 

    def destroy
        if @current_admin
            @instrument = Instrument.find(params[:id])
            @other = Instrument.find_or_create_by(name: "Other")
            
            @instrument.positions.each do |position| 
                @other.positions << position
            end
            @other.save
            
            @instrument.destroy
            redirect_to instruments_path
        else
            flash[:message] = "Admin Access Only"
            redirect_to instrument_path(params[:id])
        end
    end


    private 

    def instrument_params
        params.require(:instrument).permit(:name, position_ids:[])
    end
    
end 
