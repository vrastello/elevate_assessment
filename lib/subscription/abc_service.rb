module Subscription
  # service classes to check subscription status
  class AbcService < Service
    def client
      @client ||= ::AbcService::Client.new
    end
  end
end
