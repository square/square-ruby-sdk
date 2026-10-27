# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class OauthAuthorizationRevokedEventObject < Internal::Types::Model
      field :revocation, -> { Square::Types::OauthAuthorizationRevokedEventRevocationObject }, optional: true, nullable: false
    end
  end
end
