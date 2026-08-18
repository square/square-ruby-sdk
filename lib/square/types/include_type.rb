# frozen_string_literal: true

module Square
  module Types
    module IncludeType
      extend Square::Internal::Types::Enum

      INCLUDE_NESTED_MODIFIERS = "INCLUDE_NESTED_MODIFIERS"
      INCLUDE_ANCESTOR_MODIFIERS = "INCLUDE_ANCESTOR_MODIFIERS"
    end
  end
end
