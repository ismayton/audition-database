module ExcerptsHelper
    def number_of_lists(excerpt)
        excerpt.lists.count
    end

    private 

    def excerpt_params
        params.require(:excerpt).permit(:title, :composer_id, list_ids:[])
    end
end
