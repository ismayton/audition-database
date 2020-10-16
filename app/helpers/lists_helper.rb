module ListsHelper
    
    def full_position(list)
        list.position.title + " - " + list.orchestra.name
    end 

    def readable_date
        #date decyphering here
    end 

    private 
    
    def list_params
        params.require(:list).permit(:date, :orchestra_id, :position_id)
    end
end
