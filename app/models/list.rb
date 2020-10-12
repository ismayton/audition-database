class List < ApplicationRecord
    belongs_to :position 
    has_many :excerpts
    has_many :composers, through: :excerpts
    has_many :rounds
    
end
