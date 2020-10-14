class PositionsController < ApplicationController
    include PositionsHelper
    
    def index 
        @positions = positions_with_lists
    end


     
end
