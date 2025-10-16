# frozen_string_literal: true

module Square
  module Types
    module TransferOrderStatus
      extend Square::Internal::Types::Enum

      DRAFT = "DRAFT"
      STARTED = "STARTED"
      PARTIALLY_RECEIVED = "PARTIALLY_RECEIVED"
      COMPLETED = "COMPLETED"
      CANCELED = "CANCELED"
    end
  end
end
