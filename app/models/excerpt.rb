class Excerpt < ApplicationRecord
  belongs_to :piece
  has_one :composer, through: :piece
  has_and_belongs_to_many :lists

  
end
