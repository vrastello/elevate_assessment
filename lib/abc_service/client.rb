# naming this client abc to pretend we may have multiple subscriptions, this is built to be modular
class AbcService::Client
  include HTTParty

  def self.api_key
    Rails.application.credentials.billing_service_api_key
  end

  base_uri "https://interviews-accounts.elevateapp.com"
  headers "Authorization" => api_key
  format :json

  def get_user_status(user_id)
    self.class.get("/api/v1/users/#{user_id}/billing")
  end
end
