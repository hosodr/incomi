class Event < ApplicationRecord
  belongs_to :channel
  belongs_to :host_user, class_name:'User', foreign_key:'user_id'
end
