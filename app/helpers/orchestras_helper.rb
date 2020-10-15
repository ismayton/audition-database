module OrchestrasHelper

    def orchestras_with_lists
        Orchestra.all.select { |o| !o.lists.empty? }
    end

    private
    
    def orchestra_params
        params.require(:orchestra).permit(:name)
    end
end
