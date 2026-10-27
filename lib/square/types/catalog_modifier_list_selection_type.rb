# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CatalogModifierListSelectionType
      extend Square::Internal::Types::Enum

      SINGLE = "SINGLE"
      MULTIPLE = "MULTIPLE"
    end
  end
end
