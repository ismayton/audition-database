class Piece < ApplicationRecord
    belongs_to :composer
    has_many :excerpts

    validates :title, uniqueness: true, presence: true

    def title_and_composer
        self.title + " - " + self.composer.name
    end

end
