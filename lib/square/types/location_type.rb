# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module LocationType
      extend Square::Internal::Types::Enum

      PHYSICAL = "PHYSICAL"
      MOBILE = "MOBILE"
    end
  end
end
