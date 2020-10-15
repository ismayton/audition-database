class ComposersController < ApplicationController
    include ComposersHelper
    
    def index 
        @composers = Composer.all
    end

    def show
        @composer = Composer.find(params[:id])
    end
    
end
