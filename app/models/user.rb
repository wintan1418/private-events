class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :events, foreign_key: 'creator_id'
  has_many :attendences, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendences, source: :event
end
