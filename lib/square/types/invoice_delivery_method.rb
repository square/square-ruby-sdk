# frozen_string_literal: true

module Square
  module Types
    module InvoiceDeliveryMethod
      extend Square::Internal::Types::Enum

      EMAIL = "EMAIL"
      SHARE_MANUALLY = "SHARE_MANUALLY"
      SMS = "SMS"
    end
  end
end
