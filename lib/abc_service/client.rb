# naming this client abc to pretend we may have multiple subscriptions, this is built to be modular
class AbcService::Client
  include HTTParty

  def self.api_key
    # Rails.application.secrets.billing_service_api_key
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJiaWxsaW5nIiwiaWF0IjoxNzQzMDg1NDk5LCJleHAiOm51bGwsImF1ZCI6Ind3dy5leGFtcGxlLmNvbSIsInN1YiI6ImJpbGxpbmdfY2xpZW50In0.aRwnR_QP6AlOv_JanMkbhwe9ACDcJc5184pXdR0ksXg"
  end

  base_uri "https://interviews-accounts.elevateapp.com"
  headers "Authorization" => api_key
  format :json

  def get_user_status(user_id)
    self.class.get("/api/v1/users/#{user_id}/billing")
  end
end
