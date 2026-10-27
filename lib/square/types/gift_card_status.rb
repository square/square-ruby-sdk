# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module GiftCardStatus
      extend Square::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      DEACTIVATED = "DEACTIVATED"
      BLOCKED = "BLOCKED"
      PENDING = "PENDING"
    end
  end
end
