# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CatalogModifierToggleOverrideType
      extend Square::Internal::Types::Enum

      NO = "NO"
      YES = "YES"
      NOT_SET = "NOT_SET"
    end
  end
end
