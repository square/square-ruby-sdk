# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a collection of catalog objects for the purpose of applying a
    # `PricingRule`. Including a catalog object will include all of its subtypes.
    # For example, including a category in a product set will include all of its
    # items and associated item variations in the product set. Including an item in
    # a product set will also include its item variations.
    class CatalogProductSet < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :product_ids_any, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :product_ids_all, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :quantity_exact, -> { Integer }, optional: true, nullable: true

      field :quantity_min, -> { Integer }, optional: true, nullable: true

      field :quantity_max, -> { Integer }, optional: true, nullable: true

      field :all_products, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
