class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :game_events, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  def stats
    {
      total_games_played: game_events.count
    }
  end

  def abc_subscription
    Subscription::AbcStatusService.call(user: self)
  end
end
