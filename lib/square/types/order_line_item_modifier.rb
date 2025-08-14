# frozen_string_literal: true

module Square
    module Types
        # A [CatalogModifier](entity:CatalogModifier).
        class OrderLineItemModifier < Square::Internal::Types::Model
            field :uid, String, optional: true, nullable: false
            field :catalog_object_id, String, optional: true, nullable: false
            field :catalog_version, Integer, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :quantity, String, optional: true, nullable: false
            field :base_price_money, Square::Money, optional: true, nullable: false
            field :total_price_money, Square::Money, optional: true, nullable: false
            field :metadata, Square::Internal::Types::Hash[String, String], optional: true, nullable: false
        end
    end
end
