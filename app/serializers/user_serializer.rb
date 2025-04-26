class UserSerializer < BaseJsonSerializer
  attributes :id, :email

  attribute :stats, &:stats

  attribute :subscription_status, &:abc_subscription
end
