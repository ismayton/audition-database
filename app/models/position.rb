class Position < ApplicationRecord
    belongs_to :instrument
    has_and_belongs_to_many :orchestras
    has_many :lists

    validates :title, uniqueness: true, presence: true
end
