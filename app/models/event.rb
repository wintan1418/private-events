class Event < ApplicationRecord
  validates :description, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: "User"
  has_many :attendences, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendences, :source => :user

  scope :past, ->  { where("DATE < ?", Date.today.to_s) }
  scope :upcoming, -> { where("DATE >= ?", Date.today.to_s) }
end
