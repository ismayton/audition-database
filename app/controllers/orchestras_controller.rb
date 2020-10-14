class OrchestrasController < ApplicationController
    def index 
        @orchestras = orchestras_with_lists
    end 

    def show
        @orchestra = Orchestra.find(params[:id])
    end

    helper

    def orchestras_with_lists
        Orchestra.all.select { |o| !o.lists.empty? }
    end 
    
end
