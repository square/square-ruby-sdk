# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CardPrepaidType
      extend Square::Internal::Types::Enum

      UNKNOWN_PREPAID_TYPE = "UNKNOWN_PREPAID_TYPE"
      NOT_PREPAID = "NOT_PREPAID"
      PREPAID = "PREPAID"
    end
  end
end
