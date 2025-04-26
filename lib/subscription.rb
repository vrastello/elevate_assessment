module Subscription
  # service classes to check subscription status, trying to make this modular so we can check mutlple subscription services
  class Service
    include ActiveModel::Model
    include ActiveModel::Validations
    def self.call(...)
      new(...).call
    end

    def call
      raise NotImplementedError, "You must implement the call method"
    end
  end

  class ServiceError < StandardError
  end
end
