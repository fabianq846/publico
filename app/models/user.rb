class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         has_many :applications
         has_many :job_offers, through: :applications
         validates :name, presence: true

         has_one_attached :image

end
