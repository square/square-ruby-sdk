# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module SearchCatalogItemsRequestStockLevel
      extend Square::Internal::Types::Enum

      OUT = "OUT"
      LOW = "LOW"
    end
  end
end
