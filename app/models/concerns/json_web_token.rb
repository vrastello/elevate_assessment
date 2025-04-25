# frozen_string_literal: true

require "jwt"

module JsonWebToken
  extend ActiveSupport::Concern
  HMAC_SECRET = Rails.application.secrets.secret_key_base
  JWT_ALGORITHM = "HS256"

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET, JWT_ALGORITHM)
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, HMAC_SECRET, true, { algorithm: JWT_ALGORITHM })[0]
    HashWithIndifferentAccess.new decoded
  end
end
