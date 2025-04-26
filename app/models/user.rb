class User < ApplicationRecord
  has_many :game_events, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def stats
    {
      total_games_played: game_events.count
    }
  end

  def abc_subscription
    Subscription::AbcStatusService.call(user: self)
  end
end
