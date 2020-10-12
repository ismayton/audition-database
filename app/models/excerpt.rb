class Excerpt < ApplicationRecord
    has_many :lists
    has_many :rounds 
    belongs_to :composer
end
