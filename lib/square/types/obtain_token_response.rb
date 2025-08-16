# frozen_string_literal: true

module Square
  module Types
    # Represents an [ObtainToken](api-endpoint:OAuth-ObtainToken) response.
    class ObtainTokenResponse < Internal::Types::Model
      field :access_token, String, optional: true, nullable: false
      field :token_type, String, optional: true, nullable: false
      field :expires_at, String, optional: true, nullable: false
      field :merchant_id, String, optional: true, nullable: false
      field :subscription_id, String, optional: true, nullable: false
      field :plan_id, String, optional: true, nullable: false
      field :id_token, String, optional: true, nullable: false
      field :refresh_token, String, optional: true, nullable: false
      field :short_lived, Internal::Types::Boolean, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :refresh_token_expires_at, String, optional: true, nullable: false

    end
  end
end
