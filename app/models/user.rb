class User < ApplicationRecord
  has_many :participations
  has_many :events, through: :participations
  has_many :organised_events, foreign_key: 'admin_id', class_name: "Event"
end
