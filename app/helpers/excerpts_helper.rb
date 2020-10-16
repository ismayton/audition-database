module ExcerptsHelper
    def number_of_lists(excerpt)
        excerpt.lists.count
    end

    def full_title(excerpt)
        excerpt.movement + " - " + excerpt.location + " - " + excerpt.description
    end

    private 

    def excerpt_params
        params.require(:excerpt).permit(:title, :composer_id, list_ids:[])
    end
end
