# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module InvoiceCustomFieldPlacement
      extend Square::Internal::Types::Enum

      ABOVE_LINE_ITEMS = "ABOVE_LINE_ITEMS"
      BELOW_LINE_ITEMS = "BELOW_LINE_ITEMS"
    end
  end
end
