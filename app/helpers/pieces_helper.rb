module PiecesHelper
    
    private
    
    def piece_params
        params.require(:piece).permit(:title, :composer_id)
    end
end