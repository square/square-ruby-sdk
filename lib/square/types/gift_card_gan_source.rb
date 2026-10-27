# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module GiftCardGanSource
      extend Square::Internal::Types::Enum

      SQUARE = "SQUARE"
      OTHER = "OTHER"
    end
  end
end
