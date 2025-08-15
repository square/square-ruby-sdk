# frozen_string_literal: true

module Square
  class OauthAuthorizationRevokedEventObject < Internal::Types::Model
    field :revocation, Square::OauthAuthorizationRevokedEventRevocationObject, optional: true, nullable: false

  end
end
