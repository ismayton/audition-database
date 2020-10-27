module ExcerptsHelper
    def number_of_lists(excerpt)
        excerpt.lists.count
    end

    def full_title(excerpt)
        excerpt.piece.title + " - " + excerpt.description 
    end

    
end
