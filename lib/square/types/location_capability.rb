# frozen_string_literal: true

module Square
  module Types
    module LocationCapability
      extend Square::Internal::Types::Enum

      CREDIT_CARD_PROCESSING = "CREDIT_CARD_PROCESSING"
      AUTOMATIC_TRANSFERS = "AUTOMATIC_TRANSFERS"
      UNLINKED_REFUNDS = "UNLINKED_REFUNDS"
    end
  end
end
