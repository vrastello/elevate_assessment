module Subscription
  # get status of abc subscription
  class AbcStatusService < AbcService
    attr_accessor :user

    validates :user, presence: true

    ABC_STATUSES = %w[active expired]

    def call
      # instead of fields on user model, would be better to use redis keys that expire, this is just to prevent
      # unnecessary calls to the api, we don't need to persist this since we need to check it at least daily.
      return user.abc_subscription_status if user.abc_subscription_synced_at&.after? 1.day.ago

      response = client.get_user_status(user.id)
      # if no status is returned, we assume the user is not subscribed, we will return nil
      return if response.code == 404

      raise ServiceError, "Error fetching subscription status: #{response.body}" unless response.success?

      status = response["subscription_status"]
      # if somehow status is unknown, let it fail to alert devs of api changes
      raise ServiceError, "Incorrect status returned: #{response.body}" unless ABC_STATUSES.include?(status)

      user.update!(abc_subscription_status: status, abc_subscription_synced_at: Time.current.to_date)
      user.abc_subscription_status
    end
  end
end
