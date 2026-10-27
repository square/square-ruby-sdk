# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module DimensionOrder
      extend Square::Internal::Types::Enum

      ASC = "asc"
      DESC = "desc"
    end
  end
end
