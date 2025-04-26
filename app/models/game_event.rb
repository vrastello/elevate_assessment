class GameEvent < ApplicationRecord
  belongs_to :user

  ALLOWED_GAME_TYPES = %w[COMPLETED].freeze

  validates :type, inclusion: { in: ALLOWED_GAME_TYPES, message: "%{value} is not a valid type" }
end
