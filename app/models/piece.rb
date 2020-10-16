class Piece < ApplicationRecord
    belongs_to :composer
    has_many :excerpts
end
