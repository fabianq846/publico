class JobOffer < ApplicationRecord
    has_many :applications
    has_many :users, through: :applications
    
    validates :title, presence: true
    validates :description, length: { minimum: 10 }
end
