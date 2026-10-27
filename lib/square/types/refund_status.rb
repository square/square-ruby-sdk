# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module RefundStatus
      extend Square::Internal::Types::Enum

      PENDING = "PENDING"
      APPROVED = "APPROVED"
      REJECTED = "REJECTED"
      FAILED = "FAILED"
    end
  end
end
