# frozen_string_literal: true

module Square
  module Types
    module RefundStatus
      extend Square::Internal::Types::Enum

      PENDING = "PENDING"
      APPROVED = "APPROVED"
      REJECTED = "REJECTED"
      FAILED = "FAILED"end
  end
end
