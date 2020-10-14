module PositionsHelper
    def positions_with_lists
        Position.all.select { |p| !p.lists.empty? }
    end
end
