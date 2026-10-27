# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module InventoryAlertType
      extend Square::Internal::Types::Enum

      NONE = "NONE"
      LOW_QUANTITY = "LOW_QUANTITY"
    end
  end
end
