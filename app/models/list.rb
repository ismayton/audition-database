class List < ApplicationRecord
  belongs_to :position
  belongs_to :orchestra
  has_and_belongs_to_many :users

  has_and_belongs_to_many :excerpts
  accepts_nested_attributes_for :excerpts

  validates :date, presence: true
end
