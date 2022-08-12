class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :motorcycles, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
