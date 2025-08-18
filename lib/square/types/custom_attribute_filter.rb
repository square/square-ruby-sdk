# frozen_string_literal: true

module Square
  module Types
    # Supported custom attribute query expressions for calling the
    # [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems)
    # endpoint to search for items or item variations.
    class CustomAttributeFilter < Internal::Types::Model
      field :custom_attribute_definition_id, String, optional: true, nullable: false
      field :key, String, optional: true, nullable: false
      field :string_filter, String, optional: true, nullable: false
      field :number_filter, Square::Types::Range, optional: true, nullable: false
      field :selection_uids_filter, Internal::Types::Array[String], optional: true, nullable: false
      field :bool_filter, Internal::Types::Boolean, optional: true, nullable: false

    end
  end
end
