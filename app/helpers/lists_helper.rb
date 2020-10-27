module ListsHelper
    
    def full_position(list)
        list.position.title + " - " + list.orchestra.name
    end 

    def display_date(list)
        list.date.strftime(' %B %d, %Y')
    end 

end
