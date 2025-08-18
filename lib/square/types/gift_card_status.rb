# frozen_string_literal: true

module Square
  module Types
    module GiftCardStatus
      extend Square::Internal::Types::Enum
      ACTIVE = "ACTIVE"
      DEACTIVATED = "DEACTIVATED"
      BLOCKED = "BLOCKED"
      PENDING = "PENDING"end
  end
end
