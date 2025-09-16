# frozen_string_literal: true

module Square
  module Types
    module FulfillmentState
      extend Square::Internal::Types::Enum

      PROPOSED = "PROPOSED"
      RESERVED = "RESERVED"
      PREPARED = "PREPARED"
      COMPLETED = "COMPLETED"
      CANCELED = "CANCELED"
      FAILED = "FAILED"
    end
  end
end
