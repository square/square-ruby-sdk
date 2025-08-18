# frozen_string_literal: true

module Square
  module Types
    module GiftCardActivityRedeemStatus
      extend Square::Internal::Types::Enum
      PENDING = "PENDING"
      COMPLETED = "COMPLETED"
      CANCELED = "CANCELED"end
  end
end
