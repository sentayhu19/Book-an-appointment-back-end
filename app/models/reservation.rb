class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle
  validates :motorcycle_id, presence: true
end
