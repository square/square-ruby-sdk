# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CardCoBrand
      extend Square::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      AFTERPAY = "AFTERPAY"
      CLEARPAY = "CLEARPAY"
    end
  end
end
