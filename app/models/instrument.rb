class Instrument < ApplicationRecord
    has_many :positions
    has_many :lists, through: :positions
end
