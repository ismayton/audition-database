class List < ApplicationRecord
  belongs_to :position
  belongs_to :orchestra
  has_one :instrument, through: :position
  has_and_belongs_to_many :users
  

  has_and_belongs_to_many :excerpts
  accepts_nested_attributes_for :excerpts

  validates :date, presence: true

  scope :all_instruments, -> { left_outer_joins(:instrument).distinct }
end
