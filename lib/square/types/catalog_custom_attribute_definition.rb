# frozen_string_literal: true

module Square
  # Contains information defining a custom attribute. Custom attributes are
  # intended to store additional information about a catalog object or to associate a
  # catalog object with an entity in another system. Do not use custom attributes
  # to store any sensitive information (personally identifiable information, card details, etc.).
  # [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes)
  class CatalogCustomAttributeDefinition < Internal::Types::Model
    field :type, Square::CatalogCustomAttributeDefinitionType, optional: false, nullable: false
    field :name, String, optional: false, nullable: false
    field :description, String, optional: true, nullable: false
    field :source_application, Square::SourceApplication, optional: true, nullable: false
    field :allowed_object_types, Internal::Types::Array[Square::CatalogObjectType], optional: false, nullable: false
    field :seller_visibility, Square::CatalogCustomAttributeDefinitionSellerVisibility, optional: true, nullable: false
    field :app_visibility, Square::CatalogCustomAttributeDefinitionAppVisibility, optional: true, nullable: false
    field :string_config, Square::CatalogCustomAttributeDefinitionStringConfig, optional: true, nullable: false
    field :number_config, Square::CatalogCustomAttributeDefinitionNumberConfig, optional: true, nullable: false
    field :selection_config, Square::CatalogCustomAttributeDefinitionSelectionConfig, optional: true, nullable: false
    field :custom_attribute_usage_count, Integer, optional: true, nullable: false
    field :key, String, optional: true, nullable: false

  end
end
