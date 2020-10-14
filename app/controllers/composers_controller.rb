class ComposersController < ApplicationController
    def index 
        @composers = Composer.all
    end
end
