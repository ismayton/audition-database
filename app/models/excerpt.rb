class Excerpt < ApplicationRecord
  belongs_to :composer
  has_and_belongs_to_many :lists
end
