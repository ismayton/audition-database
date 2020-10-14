module ListsHelper
    
    def full_position(list)
        list.position.title + " - " + list.orchestra.name
    end 

end
