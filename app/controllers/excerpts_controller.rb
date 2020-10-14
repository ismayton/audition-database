class ExcerptsController < ApplicationController
    def index
        @excerpts = Excerpt.all
    end 

end
