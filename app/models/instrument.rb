class Instrument < ApplicationRecord
    has_many :positions
    has_many :lists, through: :positions

    validates :name, uniqueness: true, presence: true

    scope :with_lists, -> { joins(:lists).distinct }
end
