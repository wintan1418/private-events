class User < ApplicationRecord
    has_many :events, :as :creator
  validates :name, presence: true, uniqueness:{case_sensitive: false}, length: {minimum:3, maximum:10}
end
