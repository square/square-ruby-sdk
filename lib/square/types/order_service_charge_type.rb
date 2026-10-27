# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module OrderServiceChargeType
      extend Square::Internal::Types::Enum

      AUTO_GRATUITY = "AUTO_GRATUITY"
      CUSTOM = "CUSTOM"
    end
  end
end
