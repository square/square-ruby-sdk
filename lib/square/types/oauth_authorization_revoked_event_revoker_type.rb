# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module OauthAuthorizationRevokedEventRevokerType
      extend Square::Internal::Types::Enum

      APPLICATION = "APPLICATION"
      MERCHANT = "MERCHANT"
      SQUARE = "SQUARE"
    end
  end
end
