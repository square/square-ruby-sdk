# frozen_string_literal: true

module Square
  module Types
    module TenderBuyNowPayLaterDetailsStatus
      extend Square::Internal::Types::Enum
      AUTHORIZED = "AUTHORIZED"
      CAPTURED = "CAPTURED"
      VOIDED = "VOIDED"
      FAILED = "FAILED"end
  end
end
