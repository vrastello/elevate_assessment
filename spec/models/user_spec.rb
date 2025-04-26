require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:game_events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "#abc_subscription" do
    let(:user) { create(:user) }
    let(:abc_status_service) { instance_double(Subscription::AbcStatusService) }

    before do
      allow(Subscription::AbcStatusService).to receive(:call).with(user: user).and_return(abc_status_service)
    end

    it "calls the AbcStatusService with the correct user" do
      expect(Subscription::AbcStatusService).to receive(:call).with(user: user)
      user.abc_subscription
    end

    it "returns the result of the AbcStatusService" do
      expect(user.abc_subscription).to eq(abc_status_service)
    end
  end

  describe "#stats" do
    let(:user) { create(:user) }
    let!(:game_event1) { create(:game_event, user: user) }
    let!(:game_event2) { create(:game_event, user: user) }

    it "returns the correct stats" do
      expect(user.stats).to eq({ total_games_played: 2 })
    end
  end
end
