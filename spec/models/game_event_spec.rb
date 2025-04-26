require 'rails_helper'

RSpec.describe GameEvent, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_inclusion_of(:event_type).in_array(GameEvent::ALLOWED_EVENT_TYPES) }
  end
end
