class GameEvent < ApplicationRecord
  belongs_to :user

  ALLOWED_EVENT_TYPES = %w[COMPLETED].freeze

  validates :event_type, inclusion: { in: ALLOWED_EVENT_TYPES }
end
