# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module SearchOrdersSortField
      extend Square::Internal::Types::Enum

      CREATED_AT = "CREATED_AT"
      UPDATED_AT = "UPDATED_AT"
      CLOSED_AT = "CLOSED_AT"
    end
  end
end
