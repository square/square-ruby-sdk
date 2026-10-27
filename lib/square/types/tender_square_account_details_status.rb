# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module TenderSquareAccountDetailsStatus
      extend Square::Internal::Types::Enum

      AUTHORIZED = "AUTHORIZED"
      CAPTURED = "CAPTURED"
      VOIDED = "VOIDED"
      FAILED = "FAILED"
    end
  end
end
