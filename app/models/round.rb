class Round < ApplicationRecord
    belongs_to :list
    has_many :excerpts
end
