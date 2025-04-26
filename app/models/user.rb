class User < ApplicationRecord
  has_many :game_events, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
