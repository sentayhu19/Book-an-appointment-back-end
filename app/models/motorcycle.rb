class Motorcycle < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user
end
