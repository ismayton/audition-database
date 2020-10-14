class List < ApplicationRecord
  belongs_to :position
  belongs_to :orchestra
  has_and_belongs_to_many :excerpts

end
