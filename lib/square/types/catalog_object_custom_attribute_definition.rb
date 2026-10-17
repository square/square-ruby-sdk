# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectCustomAttributeDefinition < CatalogObjectBase
      field :custom_attribute_definition_data, -> { Square::Types::CatalogCustomAttributeDefinition }, optional: true, nullable: false
    end
  end
end
