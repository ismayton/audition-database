module PositionsHelper
    
    def positions_with_lists
        Position.all.select { |p| !p.lists.empty? }
    end

    private 
    
    def position_params
        params.require(:position).permit(:title)
    end
end
