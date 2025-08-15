# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the `RetrieveTokenStatus` endpoint.
  class RetrieveTokenStatusResponse < Internal::Types::Model
    field :scopes, Internal::Types::Array[String], optional: true, nullable: false
    field :expires_at, String, optional: true, nullable: false
    field :client_id, String, optional: true, nullable: false
    field :merchant_id, String, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
