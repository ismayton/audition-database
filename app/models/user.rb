class User < ApplicationRecord
    has_secure_password 
    validates :username, uniqueness: true, presence: true
    has_and_belongs_to_many :lists

    scope :all_admin, -> { where(admin: true) }
end
