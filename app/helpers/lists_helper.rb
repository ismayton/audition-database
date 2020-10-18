module ListsHelper
    
    def full_position(list)
        list.position.title + " - " + list.orchestra.name
    end 

    def display_date(list)
        list.date.strftime(' %B %d, %Y')
    end 

    private 
    
    def list_params
        params.require(:list).permit(:date, :orchestra_id, :position_id, 
            excerpts_attributes: [:composer_id, :piece_id, :description]
        )
    end
end
