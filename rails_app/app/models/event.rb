class Event < ApplicationRecord
  belongs_to :channel
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
end
