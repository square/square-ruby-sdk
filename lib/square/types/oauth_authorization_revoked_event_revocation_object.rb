# frozen_string_literal: true

module Square
  module Types
    class OauthAuthorizationRevokedEventRevocationObject < Internal::Types::Model
      field :revoked_at, -> { String }, optional: true, nullable: false
      field :revoker_type, -> { Square::Types::OauthAuthorizationRevokedEventRevokerType }, optional: true, nullable: false
    end
  end
end
