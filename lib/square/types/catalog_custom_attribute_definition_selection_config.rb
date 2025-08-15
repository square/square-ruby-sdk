# frozen_string_literal: true

module Square
  # Configuration associated with `SELECTION`-type custom attribute definitions.
  class CatalogCustomAttributeDefinitionSelectionConfig < Internal::Types::Model
    field :max_allowed_selections, Integer, optional: true, nullable: false
    field :allowed_selections, Internal::Types::Array[Square::CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection], optional: true, nullable: false

  end
end
