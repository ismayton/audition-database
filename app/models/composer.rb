class Composer < ApplicationRecord
    has_many :pieces
    has_many :excerpts, through: :pieces

    validates :name, uniqueness: true, presence: true
end
