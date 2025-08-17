# frozen_string_literal: true

module Square
  module Types
    module V1OrderState
      extends Square::Internal::Types::Enum
      PENDING = "PENDING"
      OPEN = "OPEN"
      COMPLETED = "COMPLETED"
      CANCELED = "CANCELED"
      REFUNDED = "REFUNDED"
      REJECTED = "REJECTED"end
  end
end
