# frozen_string_literal: true

module Square
  module Types
    module LoyaltyPromotionStatus
      extend Square::Internal::Types::Enum
      ACTIVE = "ACTIVE"
      ENDED = "ENDED"
      CANCELED = "CANCELED"
      SCHEDULED = "SCHEDULED"end
  end
end
