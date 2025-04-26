class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :email

  attribute :stats do |obj|
    obj.stats
  end

  attribute :subscription_status do |obj|
    obj.abc_subscription
  end
end
