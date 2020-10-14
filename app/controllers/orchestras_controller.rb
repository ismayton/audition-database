class OrchestrasController < ApplicationController
    def index 
        @orchestras = Orchestra.all
    end 

end
