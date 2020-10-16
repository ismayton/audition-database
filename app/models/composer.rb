class Composer < ApplicationRecord
    has_many :pieces
    has_many :excerpts, through: :pieces
end
