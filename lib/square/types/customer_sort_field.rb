# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CustomerSortField
      extend Square::Internal::Types::Enum

      DEFAULT = "DEFAULT"
      CREATED_AT = "CREATED_AT"
    end
  end
end
