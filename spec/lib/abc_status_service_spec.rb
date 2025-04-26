require 'rails_helper'

RSpec.describe Subscription::AbcStatusService, type: :model do
  let(:abc_service) { (AbcService::Client.new) }
  let(:subject) { described_class.new(user: user) }

  describe '#call' do
    context 'when the user has an active subscription' do
      let(:user) { create(:user, id: 2) }

      it 'returns status' do
        expect(subject.call).to eq "active"
      end
    end

    context 'when the user has an active subscription' do
      let(:user) { create(:user, id: 1) }

      it 'returns status' do
        expect(subject.call).to eq "expired"
      end
    end

    context 'when the user has no subscription' do
      let(:user) { create(:user, id: 103) }

      it 'returns nil' do
        expect(subject.call).to be_nil
      end
    end
  end
end
