# frozen_string_literal: true

module Square
  module Types
    # Published when a merchant/application revokes all access tokens and refresh tokens granted to an application.
    class OauthAuthorizationRevokedEvent < Internal::Types::Model
      field :merchant_id, String, optional: true, nullable: false
      field :type, String, optional: true, nullable: false
      field :event_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :data, Square::Types::OauthAuthorizationRevokedEventData, optional: true, nullable: false

    end
  end
end
