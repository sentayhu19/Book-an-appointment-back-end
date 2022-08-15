class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :motorcycles, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  def generate_jwt
    JWT.encode({ id:, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end

  def retrieve_jwt
    JWT.decode(token.remove('"'),
               Rails.application.secrets.secret_key_base).first
  end
end
