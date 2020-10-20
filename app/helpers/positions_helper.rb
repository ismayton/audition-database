module PositionsHelper
    
    private 
    
    def position_params
        params.require(:position).permit(:title)
    end
end
