class PositionsController < ApplicationController
    def index 
        @positions = Position.all
    end
end
