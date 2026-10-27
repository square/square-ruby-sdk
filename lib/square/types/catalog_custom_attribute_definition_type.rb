# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CatalogCustomAttributeDefinitionType
      extend Square::Internal::Types::Enum

      STRING = "STRING"
      BOOLEAN = "BOOLEAN"
      NUMBER = "NUMBER"
      SELECTION = "SELECTION"
    end
  end
end
