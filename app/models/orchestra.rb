class Orchestra < ApplicationRecord
    has_and_belongs_to_many :positions
    has_many :lists
end
