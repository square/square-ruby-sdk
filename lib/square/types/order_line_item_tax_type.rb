# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module OrderLineItemTaxType
      extend Square::Internal::Types::Enum

      UNKNOWN_TAX = "UNKNOWN_TAX"
      ADDITIVE = "ADDITIVE"
      INCLUSIVE = "INCLUSIVE"
    end
  end
end
