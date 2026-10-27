# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Configuration associated with `SELECTION`-type custom attribute definitions.
    class CatalogCustomAttributeDefinitionSelectionConfig < Internal::Types::Model
      field :max_allowed_selections, -> { Integer }, optional: true, nullable: true

      field :allowed_selections, -> { Internal::Types::Array[Square::Types::CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection] }, optional: true, nullable: true
    end
  end
end
