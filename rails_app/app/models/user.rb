class User < ApplicationRecord
    has_many :participations, dependent: :destroy
    has_many :events, through: :participations
    
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    include DeviseTokenAuth::Concerns::User
end
