# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module SearchVendorsRequestSortField
      extend Square::Internal::Types::Enum

      NAME = "NAME"
      CREATED_AT = "CREATED_AT"
    end
  end
end
