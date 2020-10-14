class Position < ApplicationRecord
    has_and_belongs_to_many :orchestras
    has_many :lists
end
