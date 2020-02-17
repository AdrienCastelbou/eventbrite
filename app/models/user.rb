class User < ApplicationRecord
  after_create :welcome_send
  has_many :participations
  has_many :events, through: :participations
  has_many :organised_events, foreign_key: 'admin_id', class_name: "Event"

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
