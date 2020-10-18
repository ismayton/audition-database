module InstrumentsHelper

    private 

    def instrument_params
        params.require(:instrument).permit(:name, position_ids:[])
    end
end
