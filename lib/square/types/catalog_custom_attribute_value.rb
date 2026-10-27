# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # An instance of a custom attribute. Custom attributes can be defined and
    # added to `ITEM` and `ITEM_VARIATION` type catalog objects.
    # [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes).
    class CatalogCustomAttributeValue < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :string_value, -> { String }, optional: true, nullable: true

      field :custom_attribute_definition_id, -> { String }, optional: true, nullable: false

      field :type, -> { Square::Types::CatalogCustomAttributeDefinitionType }, optional: true, nullable: false

      field :number_value, -> { String }, optional: true, nullable: true

      field :boolean_value, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :selection_uid_values, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :key, -> { String }, optional: true, nullable: false
    end
  end
end
