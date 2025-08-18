# frozen_string_literal: true

module Square
  module Types
    class OauthAuthorizationRevokedEventObject < Internal::Types::Model
      field :revocation, Square::Types::OauthAuthorizationRevokedEventRevocationObject, optional: true, nullable: false

    end
  end
end
