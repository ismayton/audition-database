class Position < ApplicationRecord
    has_many :orchestras
    has_many :lists
    
end
