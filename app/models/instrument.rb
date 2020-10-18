class Instrument < ApplicationRecord
    has_many :positions
    has_many :lists, through: :positions

    validates :name, uniqueness: true, presence: true
end
