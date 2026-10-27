# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module GiftCardType
      extend Square::Internal::Types::Enum

      PHYSICAL = "PHYSICAL"
      DIGITAL = "DIGITAL"
    end
  end
end
