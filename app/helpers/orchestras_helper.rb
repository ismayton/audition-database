module OrchestrasHelper

    private
    
    def orchestra_params
        params.require(:orchestra).permit(:name)
    end
end
