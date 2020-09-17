class User < ApplicationRecord
    has_many :participations, dependent: :destroy
    has_many :events, through: :participations
end
