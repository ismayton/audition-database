class Composer < ApplicationRecord
    has_many :pieces
    has_many :excerpts, through: :pieces

    validates :name, uniqueness: true, presence: true

    def last_name 
        self.name.split[1]
    end
    
end
