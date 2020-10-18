class InstrumentsController < ApplicationController 
    include InstrumentsHelper

    def index 
        @instruments = Instrument.all
    end

    def show
        @instrument = Instrument.find(params[:id])
    end

    def new 
        if admin?
            @instrument = Instrument.new
        else
            redirect_to instruments_path
            flash[:message] = "Admin Access Only"
        end
    end 

    def create 
        @instrument = Instrument.create(instrument_params)
        binding.pry
        redirect_to instrument_path(@instrument)
    end 

    def edit
        if admin?
            @instrument = Instrument.find(params[:id])
        else
            redirect_to instrument_path(params[:id])
            flash[:message] = "Admin Access Only"
        end 
    end 

    def update 
        @instrument = Instrument.find(params[:id])
        if !params[:instrument][:name].empty?
            @instrument.update(instrument_params)
            redirect_to instrument_path(@instrument)
        else
            render :edit
            flash[:message] = "Name is Required" 
        end 
    end 

    def destroy
        if admin?
            @instrument = Instrument.find(params[:id])
            @other = Instrument.find_or_create_by(name: "Other")
            
            @instrument.positions.each do |position| 
                @other.positions << position
            end
            @other.save
            
            @instrument.destroy
            redirect_to instruments_path
        else
            redirect_to instrument_path(params[:id])
            flash[:message] = "Admin Access Only"
        end
    end
end 
