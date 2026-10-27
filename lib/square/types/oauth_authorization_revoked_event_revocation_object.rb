# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class OauthAuthorizationRevokedEventRevocationObject < Internal::Types::Model
      field :revoked_at, -> { String }, optional: true, nullable: true

      field :revoker_type, -> { Square::Types::OauthAuthorizationRevokedEventRevokerType }, optional: true, nullable: false
    end
  end
end
