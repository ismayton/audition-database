module ComposersHelper

    private 

    def composer_params
        params.require(:composer).permit(:name)
    end
end
