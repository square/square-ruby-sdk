# frozen_string_literal: true

module Square
  class OauthAuthorizationRevokedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::OauthAuthorizationRevokedEventObject, optional: true, nullable: false

  end
end
