# frozen_string_literal: true

module Square
  module Types
    module CardPrepaidType
      extend Square::Internal::Types::Enum

      UNKNOWN_PREPAID_TYPE = "UNKNOWN_PREPAID_TYPE"
      NOT_PREPAID = "NOT_PREPAID"
      PREPAID = "PREPAID"end
  end
end
