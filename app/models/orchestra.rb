class Orchestra < ApplicationRecord
    has_and_belongs_to_many :positions
    has_many :lists

    validates :name, uniqueness: true, presence: true

    scope :with_lists, -> { joins(:lists).distinct }
end
