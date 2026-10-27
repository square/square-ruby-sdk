# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A [CatalogModifier](entity:CatalogModifier).
    class OrderLineItemModifier < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :catalog_object_id, -> { String }, optional: true, nullable: true

      field :catalog_version, -> { Integer }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :quantity, -> { String }, optional: true, nullable: true

      field :base_price_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :total_price_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: true

      field :parent_modifier_uid, -> { String }, optional: true, nullable: true
    end
  end
end
